/*
 * Copyright (c) AccountProductions and Sybren Gjaltema, 2014. All rights reserved.
 */

function fetchPage(pageNr) {
  return fetchPage(pageNr, null);
}

function fetchPage(pageNr, element) {
  var page;
  if (/^[+-]?\d+(\.\d+)?([eE][+-]?\d+)?$/.test(pageNr)) { //is a number
    page = pageNr;
  } else { //is clicked element
    page = $(pageNr).text();
  }
  if (element !== null && $(element).parent().hasClass('disabled')) {
    return false;
  }
  var players;
  var finder = $("#key").text();
  $.ajax({
    type: "GET",
    url: "../inc/ajax/search.php",
    dataType: 'json',
    data: {
      page: page,
      finder: finder
    }
  })
      .done(function (msg) {
        var totalPages;
        $('#search-list').empty();
        players = msg;
        console.log(JSON.stringify(players));
        $.each(players, function (index) {
          if (index === 0) {
            //only info
            totalPages = players[index];
            return true; //acts like continue
          }
          var player = players[index];
          var online;
          var t = player['lastleave'].split(/[- :]/);
          var lastjoin = new Date(1000 * player['lastjoin']);
          var lastleave = new Date(1000 * player['lastleave']);
          if (lastjoin > lastleave) {
            online = "Online now!";
          } else if (lastleave === 0) {
            online = "Not recorded";
          } else {
            online = lastleave.toLocaleString();
          }
          var lastOnTd = $("<td>");
          if (parseInt(t[0]) === 0) {
            lastOnTd.text(online);
          } else {
            lastOnTd.append($("<abbr>").addClass("timeago").attr("title", lastleave.toISOString()).text(online));
          }

          $("#search-list")
              .append($('<tr>')
                  .append($('<td>')
                      .append($('<img>')
                          .attr('src', 'https://minotar.net/avatar//' + player["name"] + "/16") //TODO make this dynamic
                          .addClass("img-rounded").addClass("avatar-list-icon")
                  )
                      .append(" ")
                      .append($('<a>')
                          .attr('href', 'player.php?id=' + player['player_id'])
                          .append(player["name"])
                          .attr('title', player["name"] + "&apos;s Stats")
                  )
              ).append(lastOnTd)
          );
        }); //end of each loop
        jQuery("abbr.timeago").timeago();
        page = parseInt(page);
        totalPages = parseInt(totalPages);
        console.log("Total pages : " + totalPages);
        console.log("Current page: " + page);
        var pagination = $(".pagination");
        pagination.empty();
        pagination.append($("<li>").addClass(page === 1 ? "disabled" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(" + (page - 1) + ", this)").html("&laquo;")));
        pagination.append($("<li>").addClass(page === 1 ? "active" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(this)").html(page <= 2 ? "1" : ((totalPages - page <= 1) ? (totalPages - 4) : (page - 2)))));
        if (totalPages > 2) {
          pagination.append($("<li>").addClass(page === 2 ? "active" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(this)").html(page <= 2 ? "2" : ((totalPages - page <= 1) ? (totalPages - 3) : (page - 1)))));
        }
        if (totalPages > 3) {
          pagination.append($("<li>").addClass(page !== 1 && page !== 2 && page !== totalPages && page !== (parseInt(totalPages) - 1) ? "active" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(this)").html(totalPages - page <= 2 ? (totalPages - 2) : (page > 2 ? page : "3"))));
        }
        if (totalPages > 4) {
          pagination.append($("<li>").addClass(totalPages - 1 === page ? "active" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(this)").html(page <= 2 ? "4" : ((totalPages - page <= 1) ? (totalPages - 1) : (page + 1)))));
        }
        if (totalPages > 5) {
          pagination.append($("<li>").addClass(page === totalPages ? "active" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(this)").html(page <= 2 ? "5" : ((totalPages - page <= 1) ? (totalPages) : (page + 2)))));
        }
        pagination.append($("<li>").addClass(page === totalPages || totalPages === 0 ? "disabled" : "").append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(" + (page + 1) + ", this)").html("&raquo;")));

        var older = $(".previous");
        if (page === 1) {
          older.addClass("disabled");
        } else {
          older.removeClass("disabled");
        }
        older.empty();
        older.append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(" + (page - 1) + ", this)").html("&larr; Older"));

        var newer = $(".next");
        if (page === totalPages) {
          newer.addClass("disabled");
        } else {
          newer.removeClass("disabled");
        }
        newer.empty();
        newer.append($("<a>").attr("href", "javascript:void(0)").attr("onclick", "fetchPage(" + (page + 1) + ", this)").html("Newer &rarr;"));

      }); //end of done function and ajax call
}

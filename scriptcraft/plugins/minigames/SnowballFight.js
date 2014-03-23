/*************************************************************************
## SnowballFight mini-game

### Description

This is a rough and ready prototype of a simple multi-player
shoot-em-up. To start a game with all players playing against one another...

    /js new Game_SnowballFight(60).start();

... this obviously works best if all of the players are in close
proximity within the same game world. Alternatively you can have team
matches...


    /js var redTeam = ['<player1>','<player2>',...etc]
    /js var blueTeam = ['<player3>','<player4>,...etc]
    /js var greenTeam = ['<player5>','<player6>,...etc]
    /js new Game_SnowballFight(60, {red: redTeam,blue: blueTeam,green: greenTeam}).start();

Or you can just have specific players play against each other...

    /js new Game_SnowballFight(60, ['player1','player2','player3']).start();

(where 'player1' etc are the names of actual players)
  
You specify the teams in the game as an object where each property's
name is a team name and each property's value is the list of players
on that team.  You specify the duration of the game (in seconds) You
kick off the game with the start() method.  I need to work on a
better in-game mechanism for players to choose teams and start the
game but this will do for now.

When the game starts, each player is put in survival mode and given
snowballs. The aim of the game is to hit players on opposing teams. If
you hit a player on your own team, you lose a point.
  
At the end of the game the scores for each team are broadcast and each
player returns to their previous mode of play (creative or
survival). Create a small arena with a couple of small buildings for
cover to make the game more fun.
  
***/

var bkGameMode = org.bukkit.GameMode,
  bkEntityDamageByEntityEvent = org.bukkit.event.entity.EntityDamageByEntityEvent,
  bkItemStack = org.bukkit.inventory.ItemStack,
  bkMaterial = org.bukkit.Material,
  bkSnowball = org.bukkit.entity.Snowball;

var _startGame = function( gameState ) {
  var i, 
    teamName,
    team,
    player;

  // don't let game start if already in progress (wait for game to finish)
  if ( gameState.inProgress ) {
    return;
  }
  gameState.inProgress = true;
  // reset timer
  gameState.duration = gameState.originalDuration;
  // put all players in survival mode and give them each 200 snowballs
  // 64 snowballs for every 30 seconds should be more than enough
  for ( i = 10; i < gameState.duration; i += 10 ) {
    gameState.ammo.push( gameState.ammo[ 0 ] );
  }
  
  for ( teamName in gameState.teams ) {
    gameState.teamScores[teamName] = 0;
    team = gameState.teams[ teamName ];
    for ( i = 0; i < team.length; i++ ) {
      player = server.getPlayer( team[i] );
      gameState.savedModes[ player.name ] = player.gameMode;
      player.gameMode = bkGameMode.SURVIVAL;
      player.inventory.addItem( gameState.ammo );
    }
  }
};
/*
 end the game
 */
var _endGame = function( gameState ) {
  var scores = [],
    leaderBoard = [],
    tn,
    i,
    teamName,
    team,
    player,
    handlerList;
  
  leaderBoard  = [];
  for ( tn in gameState.teamScores){
    leaderBoard.push([tn,gameState.teamScores[tn]]);
  }
  leaderBoard.sort(function(a,b){ return b[1] - a[1];});
  
  for ( i = 0; i < leaderBoard.length; i++ ) {
    scores.push( 'Team ' + leaderBoard[i][0] + ' scored ' + leaderBoard[i][1] );
  }
  
  for ( teamName in gameState.teams ) {
    team = gameState.teams[teamName];
    for ( i = 0; i < team.length; i++ ) {
      // restore player's previous game mode and take back snowballs
      player = server.getPlayer( team[i] );
      player.gameMode = gameState.savedModes[ player.name ];
      player.inventory.removeItem( gameState.ammo );
      player.sendMessage( 'GAME OVER.' );
      player.sendMessage( scores );
    }
  }
  gameState.listener.unregister();
  gameState.inProgress = false;
};
/*
 get the team the player belongs to
 */
var _getTeam = function( player, pteams ) {
  var teamName,
    team,
    i;
  for ( teamName in pteams ) {
    team = pteams[ teamName ];
    for ( i = 0; i < team.length; i++ ) {
      if ( team[i] == player.name ) {
        return teamName;
      }
    }
  }
  return null;
};
/*
 construct a new game 
 */
var createGame = function( duration, teams ) {
  var players,
    i,
    _snowBalls = new bkItemStack( bkMaterial.SNOW_BALL, 64 );

  var _gameState = {
    teams: teams,
    duration: duration,
    originalDuration: duration,
    inProgress: false,
    teamScores: {},
    listener: null,
    savedModes: {},
    ammo: [ _snowBalls ]
  };
  if ( typeof duration == 'undefined' ) {
    duration = 60;
  }
  if ( typeof teams == 'undefined' ) {
    /*
     wph 20130511 use all players
     */
    teams =  [];
    players = server.onlinePlayers;
    for ( i = 0; i < players.length; i++ ) {
      teams.push( players[i].name );
    }
  }
  //
  // allow for teams param to be either {red:['player1','player2'],blue:['player3']} or
  // ['player1','player2','player3'] if all players are against each other (no teams)
  //
  if ( teams instanceof Array ) {
    _gameState.teams = {};
    for ( i = 0;i < teams.length; i++ ) {
      _gameState.teams[ teams[i] ] = [ teams[i] ];
    }
  }
  /*
   this function is called every time a player is damaged by another entity/player
   */
  var _onSnowballHit = function( event ) {
    var snowball = event.damager;
    if ( !snowball || !( snowball instanceof bkSnowball ) ) {
      return;
    }
    var throwersTeam = _getTeam( snowball.shooter, _gameState.teams );
    var damageeTeam = _getTeam( event.entity, _gameState.teams);
    if ( !throwersTeam || !damageeTeam ) {
      return; // thrower/damagee wasn't in game
    }
    if ( throwersTeam != damageeTeam ) {
      _gameState.teamScores[ throwersTeam ]++;
    } else {
      _gameState.teamScores[ throwersTeam ]--;
    }
  };
  
  return { 
    start: function( ) {
      _startGame( _gameState );
      _gameState.listener = events.on(bkEntityDamageByEntityEvent,_onSnowballHit);
      new java.lang.Thread( function( ) {
        while ( _gameState.duration-- ) {
          java.lang.Thread.sleep( 1000 ); // sleep 1,000 millisecs (1 second)
	}
        _endGame(_gameState);
      } ).start( );
    }
  };
};
exports.Game_SnowballFight = createGame;



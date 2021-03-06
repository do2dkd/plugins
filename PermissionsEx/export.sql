/* Group guest */
INSERT INTO `{permissions_entity}` ( `name`, `type`, `prefix`, `suffix`, `default` ) VALUES ( 'guest', 0, '','', 0 );
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'modifyworld.chat', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.who', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.motd', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.intro', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.rules', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.say', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.say.me', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.msg', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.whereami', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.whereami.compass', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.midi', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'commandbook.clear', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'multiverse.access.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'multiverse.portal.access.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('guest', 0, 'stats.track', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value` ) VALUES ('guest', 0, 'rank', '', '1000' );
/* Group regidence */
INSERT INTO `{permissions_entity}` ( `name`, `type`, `prefix`, `suffix`, `default` ) VALUES ( 'regidence', 0, ' ','', 1 );
INSERT INTO `{permissions_inheritance}` ( `child`, `parent`, `type` ) VALUES ( 'regidence', 'guest',  0);
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'modifyworld.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'commandbook.whois', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dynmap.render', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dynmap.show.self', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dynmap.hide.self', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dynmap.marker.sign', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dyntrack.info.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dyntrack.edit.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dyntrack.del.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'dyntrack.create.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'deadbolt.user.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'preciousstones.benefit.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'preciousstones.whitelist.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-simpleclans.member.home', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-simpleclans.leader.home-regroup', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'simpleclans.anyone.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'simpleclans.member.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'simpleclans.leader.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'quickshop.use', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'quickshop.create.sell', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'quickshop.create.buy', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'quickshop.find', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.cansell', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.canbuy', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-wa.vbox', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.use.withdraw.items', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.use.deposit.items', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.create.sign.mailbox.withdraw', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.create.sign.mailbox.deposit', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'wa.remove', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'pvparena.user', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'mobarena.use.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'sg.arena.join.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'sg.arena.vote', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'scavenger.scavenge', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'scavenger.self.on', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'scavenger.self.off', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'scavenger.list', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'trade.ignore', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'trade.request.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'trade.accept-request.*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'stats.sign.place', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, 'stats.sign.destory', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-modifyworld.blocks.destroy.*', 'adventure-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-modifyworld.blocks.place.*', 'adventure-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-modifyworld.items.pickup.*', 'adventure-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-modifyworld.items.drop.*', 'adventure-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-modifyworld.items.have.*', 'adventure-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-modifyworld.items.use.*', 'adventure-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-preciousstones.benefit.*', 'resource-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('regidence', 0, '-preciousstones.whitelist.*', 'resource-1', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value` ) VALUES ('regidence', 0, 'rank', '', '900' );
/* Group mod */
INSERT INTO `{permissions_entity}` ( `name`, `type`, `prefix`, `suffix`, `default` ) VALUES ( 'mod', 0, ' ','', 0 );
INSERT INTO `{permissions_inheritance}` ( `child`, `parent`, `type` ) VALUES ( 'mod', 'regidence',  0);
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('mod', 0, 'commandbook.mute', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('mod', 0, 'playerfreeze.warn', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('mod', 0, 'playerfreeze.warnall', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('mod', 0, 'playerfreeze.freeze', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('mod', 0, 'playerfreeze.freezeall', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('mod', 0, 'prism.alerts', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value` ) VALUES ('mod', 0, 'rank', '', '200' );
/* Group admin */
INSERT INTO `{permissions_entity}` ( `name`, `type`, `prefix`, `suffix`, `default` ) VALUES ( 'admin', 0, '','', 0 );
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('admin', 0, '*', '', '');
INSERT INTO `{permissions}` ( `name`, `type`, `permission`, `world`, `value` ) VALUES ('admin', 0, 'rank', '', '0' );
/* World Inheritance */

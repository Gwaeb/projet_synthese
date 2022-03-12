#------------------------ Users ------------------------------------------------
sarkox = User.create(email: "a@a.a", name: "Sarkox", password: "123456")
sarkox.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Sarkox.png')), filename: 'Sarkox.png')

atomic = User.create(email: "b@b.b", name: "AtomicBloods", password: "123456")
atomic.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Atomic.png')), filename: 'Atomic.png')

gwaeb = User.create(email: "c@c.c", name: "Gwaeb", password: "123456")
gwaeb.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Gwaeb.jpg')), filename: 'Gwaeb.jpg')

potato = User.create(email: "d@d.d", name: "Potato", password: "123456")
potato.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Potato.jpg')), filename: 'Potato.jpg')

cheche = User.create(email: "e@e.e", name: "Cheche", password: "123456")
cheche.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Cheche.jpg')), filename: 'Cheche.jpg')

furitorial = User.create(email: "f@f.f", name: "Furitorial", password: "123456")
furitorial.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Furitorial.jpg')), filename: 'Furitorial.jpg')

lindorie = User.create(email: "g@g.g", name: "Lindorie", password: "123456")
lindorie.picture.attach(io: File.open(Rails.root.join('app/assets/images/users/Lindorie.jpg')), filename: 'Lindorie.jpg')

#------------------------ Champions ------------------------------------------------
aatrox = Champion.create(name: "Aatrox", position: 0, description: "This is Aatrox", price: 4800)
aatrox.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Aatrox.jpg')), filename: 'Aatrox.jpg')

ahri = Champion.create(name: "Ahri", position: 2, description: "This is Ahri", price: 4800)
ahri.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Ahri.jpg')), filename: 'Ahri.jpg')

akali = Champion.create(name: "Akali", position: 2, description: "This is Akali", price: 3150)
akali.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Akali.jpg')), filename: 'Akali.jpg')

blitzcrank = Champion.create(name: "Blitzcrank", position: 4, description: "This is Blitzcrank", price: 3150)
blitzcrank.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Blitzcrank.jpg')), filename: 'Blitzcrank.jpg')

braum = Champion.create(name: "Braum", position: 4, description: "This is Braum", price: 4800)
braum.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Braum.jpg')), filename: 'Braum.jpg')

caitlyn = Champion.create(name: "Caitlyn", position: 3, description: "This is Caitlyn", price: 4800)
caitlyn.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Caitlyn.jpg')), filename: 'Caitlyn.jpg')

chogath = Champion.create(name: "Cho'Gath", position: 1, description: "This is Cho'Gath", price: 1350)
chogath.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/ChoGath.jpg')), filename: 'ChoGath.jpg')

darius = Champion.create(name: "Darius", position: 0, description: "This is Darius", price: 4800)
darius.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Darius.jpg')), filename: 'Darius.jpg')

drmundo = Champion.create(name: "Dr. Mundo", position: 0, description: "This is Dr. Mundo", price: 450)
drmundo.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/DrMundo.jpg')), filename: 'DrMundo.jpg')

ekko = Champion.create(name: "Ekko", position: 2, description: "This is Ekko", price: 4800)
ekko.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Ekko.jpg')), filename: 'Ekko.jpg')

galio = Champion.create(name: "Galio", position: 2, description: "This is Galio", price: 3150)
galio.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Galio.jpg')), filename: 'Galio.jpg')

garen = Champion.create(name: "Garen", position: 0, description: "This is Garen", price: 450)
garen.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Garen.jpg')), filename: 'Garen.jpg')

gragas = Champion.create(name: "Gragas", position: 1, description: "This is Gragas", price: 3150)
gragas.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Gragas.jpg')), filename: 'Gragas.jpg')

illaoi = Champion.create(name: "Illaoi", position: 0, description: "This is Illaoi", price: 6300)
illaoi.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Illaoi.jpg')), filename: 'Illaoi.jpg')

kayle = Champion.create(name: "Kayle", position: 0, description: "This is Kayle", price: 450)
kayle.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Kayle.jpg')), filename: 'Kayle.jpg')

kayn = Champion.create(name: "Kayn", position: 1, description: "This is Kayn", price: 6300)
kayn.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Kayn.jpg')), filename: 'Kayn.jpg')

leona = Champion.create(name: "Leona", position: 4, description: "This is Leona", price: 4800)
leona.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Leona.jpg')), filename: 'Leona.jpg')

ornn = Champion.create(name: "Ornn", position: 0, description: "This is Ornn", price: 6300)
ornn.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Ornn.jpg')), filename: 'Ornn.jpg')

viktor = Champion.create(name: "Viktor", position: 2, description: "This is Viktor", price: 4800)
viktor.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Viktor.jpg')), filename: 'Viktor.jpg')

yorick = Champion.create(name: "Yorick", position: 0, description: "This is Yorick", price: 4800)
yorick.picture.attach(io: File.open(Rails.root.join('app/assets/images/champions/Yorick.jpg')), filename: 'Yorick.jpg')


#------------------------ Skins ------------------------------------------------
yorickSkin1 = Skin.create(name: "Meowrick", price: 1350, champion: yorick)
yorickSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/Meowrick.jpg')), filename: 'Meowrick.jpg')

caitlynSkin1 = Skin.create(name: "Pool Party Caitlyn", price: 1350, champion: caitlyn)
caitlynSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/PoolPartyCaitlyn.jpg')), filename: 'PoolPartyCaitlyn.jpg')

kayleSkin1 = Skin.create(name: "Transcended Kayle", price: 975, champion: kayle)
kayleSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/TranscendedKayle.jpg')), filename: 'TranscendedKayle.jpg')

leonaSkin1 = Skin.create(name: "Iron Solari Leona", price: 975, champion: leona)
leonaSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/IronSolariLeona.jpg')), filename: 'IronSolariLeona.jpg')


yorickSkin2 = Skin.create(name: "Arclight Yorick", price: 1350, champion: yorick)
yorickSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/ArclightYorick.jpg')), filename: 'ArclightYorick.jpg')

aatroxSkin1 = Skin.create(name: "Blood Moon Aatrox", price: 1350, champion: aatrox)
aatroxSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/BloodMoonAatrox.jpg')), filename: 'BloodMoonAatrox.jpg')

blitzcrankSkin1 = Skin.create(name: "Boom Boom Blitzcrank", price: 520, champion: blitzcrank)
blitzcrankSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/BoomBoomBlitzcrank.jpg')), filename: 'BoomBoomBlitzcrank.jpg')

drmundoSkin1 = Skin.create(name: "Corporate Mundo", price: 1820, champion: drmundo)
drmundoSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/CorporateMundo.jpg')), filename: 'CorporateMundo.jpg')


illaoiSkin1 = Skin.create(name: "Cosmic Invoker Illaoi", price: 1350, champion: illaoi)
illaoiSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/CosmicInvokerIllaoi.jpg')), filename: 'CosmicInvokerIllaoi.jpg')

chogathSkin1 = Skin.create(name: "Dark Star Cho'Gath", price: 1820, champion: chogath)
chogathSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/DarkStarChoGath.jpg')), filename: 'DarkStarChoGath.jpg')

viktorSkin1 = Skin.create(name: "Death Sworn Victor", price: 1350, champion: viktor)
viktorSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/DeathSwornViktor.jpg')), filename: 'DeathSwornViktor.jpg')

braumSkin1 = Skin.create(name: "Dragonslayer Braum", price: 975, champion: braum)
braumSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/DragonslayerBraum.jpg')), filename: 'DragonslayerBraum.jpg')


ahriSkin1 = Skin.create(name: "Elderwood Ahri", price: 1350, champion: ahri)
ahriSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/ElderwoodAhri.jpg')), filename: 'ElderwoodAhri.jpg')

ornnSkin1 = Skin.create(name: "Elderwood Ornn", price: 1350, champion: ornn)
ornnSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/ElderwoodOrnn.jpg')), filename: 'ElderwoodOrnn.jpg')

braumSkin2 = Skin.create(name: "El Tigre Braum", price: 1350, champion: braum)
braumSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/ElTigreBraum.jpg')), filename: 'ElTigreBraum.jpg')

gragasSkin1 = Skin.create(name: "Fnatic Gragas", price: 750, champion: gragas)
gragasSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/FnaticGragas.jpg')), filename: 'FnaticGragas.jpg')


drmundoSkin2 = Skin.create(name: "Frozen Prince Mundo", price: 1350, champion: drmundo)
drmundoSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/FrozenPrinceMundo.jpg')), filename: 'FrozenPrinceMundo.jpg')

galioSkin1 = Skin.create(name: "Gatekeeper Galio", price: 1820, champion: galio)
galioSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/GatekeeperGalio.jpg')), filename: 'GatekeeperGalio.jpg')

blitzcrankSkin2 = Skin.create(name: "Goalkeeper Blitzcrank", price: 520, champion: blitzcrank)
blitzcrankSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/GoalkeeperBlitzcrank.jpg')), filename: 'GoalkeeperBlitzcrank.jpg')

garenSkin1 = Skin.create(name: "God-King Garen", price: 1820, champion: garen)
garenSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/GodKingGaren.jpg')), filename: 'GodKingGaren.jpg')


akaliSkin1 = Skin.create(name: "Headhunter Akali", price: 1350, champion: akali)
akaliSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/HeadhunterAkali.jpg')), filename: 'HeadhunterAkali.jpg')

galioSkin2 = Skin.create(name: "Hextech Galio", price: 520, champion: galio)
galioSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/HextechGalio.jpg')), filename: 'HextechGalio.jpg')

dariusSkin1 = Skin.create(name: "High Noon Darius", price: 1350, champion: darius)
dariusSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/HighNoonDarius.jpg')), filename: 'HighNoonDarius.jpg')

akaliSkin2 = Skin.create(name: "Infernal Akali", price: 520, champion: akali)
akaliSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/InfernalAkali.jpg')), filename: 'InfernalAkali.jpg')


kayleSkin2 = Skin.create(name: "Iron Inquisitor Kayle", price: 750, champion: kayle)
kayleSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/IronInquisitorKayle.jpg')), filename: 'IronInquisitorKayle.jpg')

chogathSkin2 = Skin.create(name: "Loch Ness Cho'Gath", price: 520, champion: chogath)
chogathSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/LochNessChoGath.jpg')), filename: 'LochNessChoGath.jpg')

caitlynSkin2 = Skin.create(name: "Lunar Wraith Caitlyn", price: 1350, champion: caitlyn)
caitlynSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/LunarWraithCaitlyn.jpg')), filename: 'LunarWraithCaitlyn.jpg')

garenSkin2 = Skin.create(name: "Mecha Kingdoms Garen", price: 1350, champion: garen)
garenSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/MechaKingdomsGaren.jpg')), filename: 'MechaKingdomsGaren.jpg')


kaynSkin1 = Skin.create(name: "Odyssey Kayn", price: 1820, champion: kayn)
kaynSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/OdysseyKayn.jpg')), filename: 'OdysseyKayn.jpg')

ekkoSkin1 = Skin.create(name: "PROJECT Ekko", price: 1350, champion: ekko)
ekkoSkin1.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/PROJECTEkko.jpg')), filename: 'PROJECTEkko.jpg')

viktorSkin2 = Skin.create(name: "Psy Ops Viktor", price: 1350, champion: viktor)
viktorSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/PsyOpsViktor.jpg')), filename: 'PsyOpsViktor.jpg')

gragasSkin2 = Skin.create(name: "Scuba Gragas", price: 975, champion: gragas)
gragasSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/ScubaGragas.jpg')), filename: 'ScubaGragas.jpg')


aatroxSkin2 = Skin.create(name: "Sea Hunter Aatrox", price: 750, champion: aatrox)
aatroxSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/SeaHunterAatrox.jpg')), filename: 'SeaHunterAatrox.jpg')

leonaSkin2 = Skin.create(name: "Solar Eclipse Leona", price: 1820, champion: leona)
leonaSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/SolarEclipseLeona.jpg')), filename: 'SolarEclipseLeona.jpg')

kaynSkin2 = Skin.create(name: "Soulhunter Kayn", price: 1350, champion: kayn)
kaynSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/SoulhunterKayn.jpg')), filename: 'SoulhunterKayn.jpg')

ahriSkin2 = Skin.create(name: "Star Guardian Ahri", price: 1820, champion: ahri)
ahriSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/StarGuardianAhri.jpg')), filename: 'StarGuardianAhri.jpg')


ornnSkin2 = Skin.create(name: "Thunder Lord Ornn", price: 1350, champion: ornn)
ornnSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/ThunderLordOrnn.jpg')), filename: 'ThunderLordOrnn.jpg')

ekkoSkin2 = Skin.create(name: "True Damage Ekko", price: 1820, champion: ekko)
ekkoSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/TrueDamageEkko.jpg')), filename: 'TrueDamageEkko.jpg')

illaoiSkin2 = Skin.create(name: "Void Bringer Illaoi", price: 1350, champion: illaoi)
illaoiSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/VoidBringerIllaoi.jpg')), filename: 'VoidBringerIllaoi.jpg')

dariusSkin2 = Skin.create(name: "Woad King Darius", price: 975, champion: darius)
dariusSkin2.picture.attach(io: File.open(Rails.root.join('app/assets/images/skins/WoadKingDarius.jpg')), filename: 'WoadKingDarius.jpg')

#------------------------ Items ------------------------------------------------
berserkBoot = Item.create(name: "Berserker's Graves Boot", description: "Attack speed: 35%, Movement speed: 45%", price: "1100")
berserkBoot.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Berserker\'s_Greaves_item.png')), filename: 'Berserker\'s_Greaves_item.png')

eclipse = Item.create(name: "Eclipse", description: "Attack dammage: 55, Omnivamp: 8%", price: "3100")
eclipse.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Eclipse_item.png')), filename: 'Eclipse_item.png')

lostChapter = Item.create(name: "Lost Chapter", description: "Mana: 300, Ability power: 40, Ability haste: 10", price: "1300")
lostChapter.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Lost_Chapter_item.png')), filename: 'Lost_Chapter_item.png')

phantomDancer = Item.create(name: "Phantom Dancer", description: "Attack dammage: 20, Critical strike: 20%, Attack spped: 25%, Movement speed: 25%", price: "2600")
phantomDancer.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Phantom_Dancer_item.png')), filename: 'Phantom_Dancer_item.png')

morellonomicon = Item.create(name: "Morellonomicon", description: "Health: 250, Ability power: 80", price: "2500")
morellonomicon.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Morellonomicon_item.png')), filename: 'Morellonomicon_item.png')

runaan = Item.create(name: "Runaan'S Hurricane", description: "Critical strike: 20%, Attack spped: 45%, Movement speed: 7%", price: "2600")
runaan.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Runaan\'s_Hurricane_item.png')), filename: 'Runaan\'s_Hurricane_item.png')

infinityEdge = Item.create(name: "Infinity Edge", description: "Attack dammage: 70, Critical strike: 20%", price: "3400")
infinityEdge.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Infinity_Edge_item.png')), filename: 'Infinity_Edge_item.png')

botrk = Item.create(name: "Blade of the Ruined King", description: "Attack dammage: 40, Attack spped: 25%, Life steal: 10%", price: "3300")
botrk.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Blade_of_the_Ruined_King_item.png')), filename: 'Blade_of_the_Ruined_King_item.png')

warmog = Item.create(name: "Warmog' Armor", description: "Ability haste: 10, Health: 800, Base health regeneration: 200%", price: "3000")
warmog.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Warmogs_Armor_item.png')), filename: 'Warmogs_Armor_item.png')

rabadon = Item.create(name: "Rabadon's Deathcap", description: "Ability power: 120", price: "3600")
rabadon.picture.attach(io: File.open(Rails.root.join('app/assets/images/items/Rabadons_Deathcap_item.png')), filename: 'Rabadons_Deathcap_item.png')

#------------------------ Category ------------------------------------------------
catPrecision = Category.create(name: "Precision", description: "Improved attacks and sustained damage")
catPrecision.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/precision.png')), filename: 'precision.png')

catDomination = Category.create(name: "Domination", description: "Burst damage and target access")
catDomination.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/domination.png')), filename: 'domination.png')

catSorcery = Category.create(name: "Sorcery", description: "Empowered abilities and resource manipulation")
catSorcery.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/sorcery.png')), filename: 'sorcery.png')

catResolve = Category.create(name: "Resolve", description: "Durability and crowd control")
catResolve.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/resolve.png')), filename: 'resolve.png')

catInspiration = Category.create(name: "Inspiration", description: "Creative tools and rule bending")
catInspiration.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/inspiration.png')), filename: 'inspiration.png')

catAutre = Category.create(name: "Other", description: "The shards")
catAutre.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/sorcery.png')), filename: 'other.png')

#------------------------ Runes ------------------------------------------------

##-- Precision
runePress = Rune.create(name: "Press the attack", description: "hit an ennemie..", level: 0, category: catPrecision)
runePress.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Press_the_Attack_rune.png')), filename: 'Press_the_Attack_rune.png')

runeLethal = Rune.create(name: "Lethal thempo", description: "Gain attack speed..", level: 0, category: catPrecision)
runeLethal.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Lethal_Tempo_rune.png')), filename: 'Lethal_Tempo_rune.png')

runeFleet = Rune.create(name: "Fleet Footwork", description: "Attacking and moving..", level: 0, category: catPrecision)
runeFleet.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Fleet_Footwork_rune.png')), filename: 'Fleet_Footwork_rune.png')

runeConqu = Rune.create(name: "Conqueror", description: "Gain stack of adaptive..", level: 0, category: catPrecision)
runeConqu.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Conqueror_rune.png')), filename: 'Conqueror_rune.png')

runeOverheal = Rune.create(name: "Overheal", description: "Excess healing..", level: 1, category: catPrecision)
runeOverheal.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Overheal_rune.png')), filename: 'Overheal_rune.png')

runeTriumph = Rune.create(name: "Triumph", description: "Takedown restore 12%..", level: 1, category: catPrecision)
runeTriumph.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Triumph_rune.png')), filename: 'Triumph_rune.png')

runePresence = Rune.create(name: "Presence of mind", description: "Increase your mana or energy..", level: 1, category: catPrecision)
runePresence.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Presence_of_Mind_rune.png')), filename: 'Presence_of_Mind_rune.png')

runeAlacrity = Rune.create(name: "Legend: Alacrity", description: "Takedowns on ennemies grant premanent Attack Speed..", level: 2, category: catPrecision)
runeAlacrity.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Legend-_Alacrity_rune.png')), filename: 'Alacrity_rune.png')

runeTenacity = Rune.create(name: "Legend: Tenacity", description: "Takedowns on ennemies grant premanent Tenacity..", level: 2, category: catPrecision)
runeTenacity.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Legend-_Tenacity_rune.png')), filename: 'Tenacity_rune.png')

runeBloodline = Rune.create(name: "Legend: Bloodline", description: "Takedowns on ennemies grant premanent Lifesteal..", level: 2, category: catPrecision)
runeBloodline.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Legend-_Bloodline_rune.png')), filename: 'Bloodline_rune.png')

runeCoupGrace = Rune.create(name: "Coup de Grace", description: "Deal more damage to low ennemie..", level: 3, category: catPrecision)
runeCoupGrace.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Coup_de_Grace_rune.png')), filename: 'Coup_de_Grace_rune.png')

runeCutDown = Rune.create(name: "Cut Down", description: "Deal more damage to champion..", level: 3, category: catPrecision)
runeCutDown.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Cut_Down_rune.png')), filename: 'Cut_Down_rune.png')

runeLastStand = Rune.create(name: "Last Stand", description: "Deal more damage to low champion..", level: 3, category: catPrecision)
runeLastStand.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/precision/Last_Stand_rune.png')), filename: 'Last_Stand_rune.png')

##-- Domination

runeElectrocute = Rune.create(name: "Electrocute", description: "hiting a champion with 3..", level: 0, category: catDomination)
runeElectrocute.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Electrocute_rune.png')), filename: 'Electrocute_rune.png')

runePredator = Rune.create(name: "Predator", description: "Add an active effect to your boot..", level: 0, category: catDomination)
runePredator.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Predator_rune.png')), filename: 'Predator_rune.png')

runeDarkHarvest = Rune.create(name: "Dark Harvest", description: "Damaging a low champion..", level: 0, category: catDomination)
runeDarkHarvest.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Dark_Harvest_rune.png')), filename: 'Dark_Harvest_rune.png')

runeHailOfBlades = Rune.create(name: "Hails Of Blades", description: "Gain a large amount of  attack speed..", level: 0, category: catDomination)
runeHailOfBlades.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Hail_of_Blades_rune.png')), filename: 'Hail_of_Blades_rune.png')

runeCheapShot = Rune.create(name: "Cheap Shot", description: "Deal bonus true damage..", level: 1, category: catDomination)
runeCheapShot.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Cheap_Shot_rune.png')), filename: 'Cheap_Shot_rune.png')

runeTastOfBlood = Rune.create(name: "Taste of Blood", description: "Heal when you damage a champion..", level: 1, category: catDomination)
runeTastOfBlood.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Taste_of_Blood_rune.png')), filename: 'Taste_of_Blood_rune.png')

runeSuddenImpact = Rune.create(name: "Sudden Impact", description: "Gain a burst of letality..", level: 1, category: catDomination)
runeSuddenImpact.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Sudden_Impact_rune.png')), filename: 'Sudden_Impact_rune.png')

runeZombieWard = Rune.create(name: "Zombie Ward", description: "Takedowns on ennemies wards..", level: 2, category: catDomination)
runeZombieWard.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Zombie_Ward_rune.png')), filename: 'Zombie_Ward_rune.png')

runeGhostPoro = Rune.create(name: "Ghost Poro", description: "When your ward expire..", level: 2, category: catDomination)
runeGhostPoro.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Ghost_Poro_rune.png')), filename: 'Ghost_Poro_rune.png')

runeEyeball = Rune.create(name: "Eyeball Collection", description: "Collect eyeball for champion..", level: 2, category: catDomination)
runeEyeball.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Eyeball_Collection_rune.png')), filename: 'Eyeball_Collection_rune.png')

runeRavenousHunter = Rune.create(name: "Ravenous Hunter", description: "Unique takedown grant speed..", level: 3, category: catDomination)
runeRavenousHunter.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Ravenous_Hunter_rune.png')), filename: 'Ravenous_Hunter_rune.png')

runeIgenious = Rune.create(name: "Igenious Hunter", description: "Unique takedown grant life..", level: 3, category: catDomination)
runeIgenious.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Ingenious_Hunter_rune.png')), filename: 'Ingenious_Hunter_rune.png')

runeRelentless = Rune.create(name: "Relentless Hunter", description: "Unique takedown grant a lot..", level: 3, category: catDomination)
runeRelentless.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Relentless_Hunter_rune.png')), filename: 'Relentless_Hunter_rune.png')

runeUltimateHunter = Rune.create(name: "Ultimate Hunter", description: "Unique takedown grant..", level: 3, category: catDomination)
runeUltimateHunter.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/domination/Ultimate_Hunter_rune.png')), filename: 'Ultimate_Hunter_rune.png')

##-- Sorcery

runeSummon = Rune.create(name: "Summon Aery", description: "Your attack and ability..", level: 0, category: catSorcery)
runeSummon.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Summon_Aery_rune.png')), filename: 'Summon_Aery_rune.png')

runeArcane = Rune.create(name: "Arcane Comet", description: "Damaging a champion..", level: 0, category: catSorcery)
runeArcane.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Arcane_Comet_rune.png')), filename: 'Arcane_Comet_rune.png')

runePhase = Rune.create(name: "Phase Rush", description: "Hitting an ennemie champion with..", level: 0, category: catSorcery)
runePhase.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Phase_Rush_rune.png')), filename: 'Phase_Rush_rune.png')

runeNullifying = Rune.create(name: "Nullifying Orb", description: "Gain a magic damage shield..", level: 1, category: catSorcery)
runeNullifying.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Nullifying_Orb_rune.png')), filename: 'Nullifying_Orb_rune.png')

runeManaFlow = Rune.create(name: "Manaflow Band", description: "Hitting an ennemie champion..", level: 1, category: catSorcery)
runeManaFlow.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Manaflow_Band_rune.png')), filename: 'Manaflow_Band_rune.png')

runeNimbus = Rune.create(name: "Nimbus Cloak", description: "After casting a summoner spells..", level: 1, category: catSorcery)
runeNimbus.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Nimbus_Cloak_rune.png')), filename: 'Nimbus_Cloak_rune.png')

runeTranscendence = Rune.create(name: "Transcendence", description: "Gain bonuses upon reaching..", level: 2, category: catSorcery)
runeTranscendence.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Transcendence_rune.png')), filename: 'Transcendence_rune.png')

runeCelerity = Rune.create(name: "Celerity", description: "All Move Speed bonuses..", level: 2, category: catSorcery)
runeCelerity.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Celerity_rune.png')), filename: 'Celerity_rune.png')

runeAbsolute = Rune.create(name: "Absolute Focus", description: "Grant bonuses based on which stat you..", level: 2, category: catSorcery)
runeAbsolute.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Absolute_Focus_rune.png')), filename: 'Absolute_Focus_rune.png')

runeScorch = Rune.create(name: "Scorch", description: "Your first damage ability..", level: 3, category: catSorcery)
runeScorch.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Scorch_rune.png')), filename: 'Scorch_rune.png')

runeWater = Rune.create(name: "WaterWalking", description: "Gains Movement Speed..", level: 3, category: catSorcery)
runeWater.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Waterwalking_rune.png')), filename: 'Waterwalking_rune.png')

runeGathering = Rune.create(name: "Gathering Strorm", description: "Gain incresing amount of..", level: 3, category: catSorcery)
runeGathering.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/sorcery/Gathering_Storm_rune.png')), filename: 'Gathering_Storm_rune.png')

##-- Resolve

runeGrasp = Rune.create(name: "Grasp of the Undying", description: "Every 4s your next..", level: 0, category: catResolve)
runeGrasp.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Grasp_of_the_Undying_rune.png')), filename: 'Grasp_of_the_Undying_rune.png')

runeAftershock = Rune.create(name: "Aftershock", description: "After immobilizing..", level: 0, category: catResolve)
runeAftershock.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Aftershock_rune.png')), filename: 'Aftershock_rune.png')

runeGuardian = Rune.create(name: "Guardian", description: "Guard allies you cast spells..", level: 0, category: catResolve)
runeGuardian.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Guardian_rune.png')), filename: 'Guardian_rune.png')

runeDemolish = Rune.create(name: "Demolish", description: "Charge up a powerful attack..", level: 1, category: catResolve)
runeDemolish.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Demolish_rune.png')), filename: 'Demolish_rune.png')

runeFontOfLife = Rune.create(name: "Font of Life", description: "Imparing the movement of an enemy..", level: 1, category: catResolve)
runeFontOfLife.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Font_of_Life_rune.png')), filename: 'Font_of_Life_rune.png')

runeShieldBash = Rune.create(name: "Shield Bash", description: "Whenever you gain a shield..", level: 1, category: catResolve)
runeShieldBash.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Shield_Bash_rune.png')), filename: 'Shield_Bash_rune.png')

runeConditioning = Rune.create(name: "Conditioning", description: "After 12 min gain +9..", level: 2, category: catResolve)
runeConditioning.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Conditioning_rune.png')), filename: 'Conditioning_rune.png')

runeSecondWind = Rune.create(name: "Second Wind", description: "After taking damage from ennemies..", level: 2, category: catResolve)
runeSecondWind.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Second_Wind_rune.png')), filename: 'Second_Wind_rune.png')

runeBone = Rune.create(name: "Bone Plating", description: "After taking damage from..", level: 2, category: catResolve)
runeBone.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Bone_Plating_rune.png')), filename: 'Bone_Plating_rune.png')

runeOver = Rune.create(name: "Overgrowth", description: "Gain permanent max heal..", level: 3, category: catResolve)
runeOver.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Overgrowth_rune.png')), filename: 'Overgrowth_rune.png')

runeRevitalize = Rune.create(name: "Revitalize", description: "Gain 5% Heal and Shield..", level: 3, category: catResolve)
runeRevitalize.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Revitalize_rune.png')), filename: 'Revitalize_rune.png')

runeUnflinch = Rune.create(name: "Unflinching", description: "Gain a small amount..", level: 3, category: catResolve)
runeUnflinch.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/resolve/Unflinching_rune.png')), filename: 'Unflinching_rune.png')


##-- Inspiration

runeGlacial = Rune.create(name: "Glacial Augment", description: "Immobilizing an ennemie champion..", level: 0, category: catInspiration)
runeGlacial.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Glacial_Augment_rune.png')), filename: 'Glacial_Augment_rune.png')

runeUnseal = Rune.create(name: "Unsealed Spellbook", description: "Swap Summoner Spelks while out..", level: 0, category: catInspiration)
runeUnseal.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Unsealed_Spellbook_rune.png')), filename: 'Unsealed_Spellbook_rune.png')

runeFirstStrike = Rune.create(name: "First Strike", description: "When you initiale champion combat..", level: 0, category: catInspiration)
runeFirstStrike.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/First_Strike_rune.png')), filename: 'First_Strike_rune.png')

runeHextech = Rune.create(name: "Hextech Flashtraption", description: "While Flash is on cooldown..", level: 1, category: catInspiration)
runeHextech.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Hextech_Flashtraption_rune.png')), filename: 'Hextech_Flashtraption_rune.png')

runeMagical = Rune.create(name: "Magical Footwear", description: "You get free boots at 12m..", level: 1, category: catInspiration)
runeMagical.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Magical_Footwear_rune.png')), filename: 'Magical_Footwear_rune.png')

runePerfect = Rune.create(name: "Perfect Timing", description: "Gain a free Commencing Stopwatch..", level: 1, category: catInspiration)
runePerfect.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Perfect_Timing_rune.png')), filename: 'Perfect_Timing_rune.png')

runeFutur = Rune.create(name: "Furtur's Market", description: "You can enter debt to buy..", level: 2, category: catInspiration)
runeFutur.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Future\'s_Market_rune.png')), filename: 'Furtures_Market_rune.png')

runeMinion = Rune.create(name: "Minion Dematerializer", description: "Start the game with 3 Minion..", level: 2, category: catInspiration)
runeMinion.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Minion_Dematerializer_rune.png')), filename: 'Minion_Dematerializer_rune.png')

runeBiscuit = Rune.create(name: "Biscuit Delivery", description: "Gain a free Biscuit every..", level: 2, category: catInspiration)
runeBiscuit.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Biscuit_Delivery_rune.png')), filename: 'Biscuit_Delivery_rune.png')

runeCosmic = Rune.create(name: "Cosmic Insight", description: "+18 Summoner Spell Haste..", level: 3, category: catInspiration)
runeCosmic.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Cosmic_Insight_rune.png')), filename: 'Cosmic_Insight_rune.png')

runeApproach = Rune.create(name: "Approach Velocity", description: "Bonus MS towards nearby enemy..", level: 3, category: catInspiration)
runeApproach.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Approach_Velocity_rune.png')), filename: 'Approach_Velocity_rune.png')

runeTime = Rune.create(name: "Time Warp Tonic", description: "Potions and biscuits grant some..", level: 3, category: catInspiration)
runeTime.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/inspiration/Time_Warp_Tonic_rune.png')), filename: 'Time_Warp_Tonic_rune.png')

##-- Shards

runeAdaptiveForce = Rune.create(name: "Adaptive", description: "+9 Adaptive Force", level: 3, category: catAutre)
runeAdaptiveForce.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/shards/Rune_shard_Adaptive_Force.png')), filename: 'Rune_shard_Adaptive_Force.png')

runeAttackSpeed = Rune.create(name: "Attack", description: "+10% Attack Speed", level: 1, category: catAutre)
runeAttackSpeed.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/shards/Rune_shard_Attack_Speed.png')), filename: 'Rune_shard_Attack_Speed.png')

runeAbilityHaste = Rune.create(name: "Ability", description: "+8 Ability Haste", level: 1, category: catAutre)
runeAbilityHaste.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/shards/Rune_shard_Cooldown_Reduction.png')), filename: 'Rune_shard_Cooldown_Reduction.png')

runeArmor = Rune.create(name: "Armor", description: "+6 Armor", level: 5, category: catAutre)
runeArmor.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/shards/Rune_shard_Armor.png')), filename: 'Rune_shard_Armor.png')

runeMagicResist = Rune.create(name: "Magic", description: "+8 Magic Resist", level: 5, category: catAutre)
runeMagicResist.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/shards/Rune_shard_Magic_Resistance.png')), filename: 'Rune_shard_Magic_Resistance.png')

runeHealth = Rune.create(name: "Health", description: "+15-140 Health (based on level)", level: 3, category: catAutre)
runeHealth.picture.attach(io: File.open(Rails.root.join('app/assets/images/runes/shards/Rune_shard_Health.png')), filename: 'Rune_shard_Health.png')


#------------------------ Builds ------------------------------------------------

build1 = Build.create(name: "AttackSpeed Omnivamp", category: 0, user: sarkox)
build1_item1 = BuildsHasItem.create(build: build1, item: berserkBoot, order: 0)
build1_item2 = BuildsHasItem.create(build: build1, item: eclipse, order: 1)
build1_item3 = BuildsHasItem.create(build: build1, item: phantomDancer, order: 2)

build2 = Build.create(name: "DMG AP/AD", category: 1, user: sarkox)
build2_item1 = BuildsHasItem.create(build: build2, item: phantomDancer, order: 0)
build2_item2 = BuildsHasItem.create(build: build2, item: lostChapter, order: 1)
build2_item3 = BuildsHasItem.create(build: build2, item: berserkBoot, order: 2)

build3 = Build.create(name: "Boot", category: 2, user: sarkox)
build3_item1 = BuildsHasItem.create(build: build3, item: berserkBoot, order: 0)

build4 = Build.create(name: "Full build", category: 2, user: sarkox)
build4_item1 = BuildsHasItem.create(build: build4, item: warmog, order: 0)
build4_item2 = BuildsHasItem.create(build: build4, item: eclipse, order: 1)
build4_item3 = BuildsHasItem.create(build: build4, item: phantomDancer, order: 2)
build4_item4 = BuildsHasItem.create(build: build4, item: runaan, order: 3)
build4_item5 = BuildsHasItem.create(build: build4, item: infinityEdge, order: 4)
build4_item6 = BuildsHasItem.create(build: build4, item: botrk, order: 5)

build5 = Build.create(name: "PhantomBuild", category: 3, user: sarkox)
build5_item1 = BuildsHasItem.create(build: build5, item: phantomDancer, order: 0)
build5_item2 = BuildsHasItem.create(build: build5, item: lostChapter, order: 1)
build5_item3 = BuildsHasItem.create(build: build5, item: rabadon, order: 2)
build5_item4 = BuildsHasItem.create(build: build5, item: morellonomicon, order: 3)

build6 = Build.create(name: "AP/AD Build", category: 4, user: sarkox)
build6_item1 = BuildsHasItem.create(build: build6, item: lostChapter, order: 0)
build6_item2 = BuildsHasItem.create(build: build6, item: eclipse, order: 1)

build7 = Build.create(name: "Attack speed", category: 1, user: atomic)
build7_item1 = BuildsHasItem.create(build: build7, item: phantomDancer, order: 0)
build7_item2 = BuildsHasItem.create(build: build7, item: runaan, order: 1)
build7_item3 = BuildsHasItem.create(build: build7, item: berserkBoot, order: 2)

build8 = Build.create(name: "AP tank", category: 2, user: atomic)
build8_item1 = BuildsHasItem.create(build: build8, item: rabadon, order: 0)
build8_item2 = BuildsHasItem.create(build: build8, item: lostChapter, order: 1)
build8_item3 = BuildsHasItem.create(build: build8, item: botrk, order: 2)
build8_item4 = BuildsHasItem.create(build: build8, item: infinityEdge, order: 3)
build8_item5 = BuildsHasItem.create(build: build8, item: morellonomicon, order: 4)
build8_item6 = BuildsHasItem.create(build: build8, item: warmog, order: 5)

build9 = Build.create(name: "Tank", category: 3, user: atomic)
build9_item1 = BuildsHasItem.create(build: build9, item: berserkBoot, order: 0)
build9_item2 = BuildsHasItem.create(build: build9, item: warmog, order: 1)
build9_item3 = BuildsHasItem.create(build: build9, item: morellonomicon, order: 2)
build9_item4 = BuildsHasItem.create(build: build9, item: botrk, order: 3)

#------------------------ Rune Page ------------------------------------------------

rune_page1 = RunePage.create(name: "Braum", user: sarkox)
rune_page1_rune1 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeGuardian)
rune_page1_rune2 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeFontOfLife)
rune_page1_rune3 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeBone)
rune_page1_rune4 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeUnflinch)
rune_page1_rune5 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeBiscuit)
rune_page1_rune6 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeCosmic)
rune_page1_rune7 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeAbilityHaste)
rune_page1_rune8 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeArmor)
rune_page1_rune9 = RunesHasRunesPage.create(rune_page: rune_page1, rune: runeHealth)

rune_page2 = RunePage.create(name: "Kayle", user: atomic)
rune_page2_rune1 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runePress)
rune_page2_rune2 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeTriumph)
rune_page2_rune3 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeAlacrity)
rune_page2_rune4 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeLastStand)
rune_page2_rune5 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeBone)
rune_page2_rune6 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeOver)
rune_page2_rune7 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeAttackSpeed)
rune_page2_rune8 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeMagicResist)
rune_page2_rune9 = RunesHasRunesPage.create(rune_page: rune_page2, rune: runeArmor)

rune_page3 = RunePage.create(name: "Leona", user: sarkox)
rune_page3_rune1 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeAftershock)
rune_page3_rune2 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeFontOfLife)
rune_page3_rune3 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeSecondWind)
rune_page3_rune4 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeOver)
rune_page3_rune5 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeBiscuit)
rune_page3_rune6 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeCosmic)
rune_page3_rune7 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeAdaptiveForce)
rune_page3_rune8 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeArmor)
rune_page3_rune9 = RunesHasRunesPage.create(rune_page: rune_page3, rune: runeArmor)

rune_page4 = RunePage.create(name: "Aatrox", user: sarkox)
rune_page4_rune1 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeConqu)
rune_page4_rune2 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeTriumph)
rune_page4_rune3 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeTenacity)
rune_page4_rune4 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeLastStand)
rune_page4_rune5 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeSecondWind)
rune_page4_rune6 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeUnflinch)
rune_page4_rune7 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeAdaptiveForce)
rune_page4_rune8 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeAdaptiveForce)
rune_page4_rune9 = RunesHasRunesPage.create(rune_page: rune_page4, rune: runeArmor)

rune_page5 = RunePage.create(name: "Viktor", user: atomic)
rune_page5_rune1 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeFirstStrike)
rune_page5_rune2 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeMagical)
rune_page5_rune3 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeBiscuit)
rune_page5_rune4 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeCosmic)
rune_page5_rune5 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeManaFlow)
rune_page5_rune6 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeTranscendence)
rune_page5_rune7 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeAttackSpeed)
rune_page5_rune8 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeAdaptiveForce)
rune_page5_rune9 = RunesHasRunesPage.create(rune_page: rune_page5, rune: runeArmor)

rune_page6 = RunePage.create(name: "Mundo", user: sarkox)
rune_page6_rune1 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeGrasp)
rune_page6_rune2 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeDemolish)
rune_page6_rune3 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeSecondWind)
rune_page6_rune4 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeOver)
rune_page6_rune5 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeMagical)
rune_page6_rune6 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeApproach)
rune_page6_rune7 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeAttackSpeed)
rune_page6_rune8 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeArmor)
rune_page6_rune9 = RunesHasRunesPage.create(rune_page: rune_page6, rune: runeHealth)

rune_page7 = RunePage.create(name: "Ekko", user: sarkox)
rune_page7_rune1 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeDarkHarvest)
rune_page7_rune2 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeSuddenImpact)
rune_page7_rune3 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeEyeball)
rune_page7_rune4 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeRavenousHunter)
rune_page7_rune5 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeMagical)
rune_page7_rune6 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeCosmic)
rune_page7_rune7 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeAttackSpeed)
rune_page7_rune8 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeAdaptiveForce)
rune_page7_rune9 = RunesHasRunesPage.create(rune_page: rune_page7, rune: runeArmor)

rune_page8 = RunePage.create(name: "Gragas", user: atomic)
rune_page8_rune1 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeGrasp)
rune_page8_rune2 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeDemolish)
rune_page8_rune3 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeConditioning)
rune_page8_rune4 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeOver)
rune_page8_rune5 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeManaFlow)
rune_page8_rune6 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeTranscendence)
rune_page8_rune7 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeAbilityHaste)
rune_page8_rune8 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeAdaptiveForce)
rune_page8_rune9 = RunesHasRunesPage.create(rune_page: rune_page8, rune: runeArmor)

rune_page9 = RunePage.create(name: "Kayn", user: sarkox)
rune_page9_rune1 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeConqu)
rune_page9_rune2 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeTriumph)
rune_page9_rune3 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeTenacity)
rune_page9_rune4 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeLastStand)
rune_page9_rune5 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeMagical)
rune_page9_rune6 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeCosmic)
rune_page9_rune7 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeAdaptiveForce)
rune_page9_rune8 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeAdaptiveForce)
rune_page9_rune9 = RunesHasRunesPage.create(rune_page: rune_page9, rune: runeHealth)

rune_page10 = RunePage.create(name: "Illaoi", user: sarkox)
rune_page10_rune1 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeConqu)
rune_page10_rune2 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runePresence)
rune_page10_rune3 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeTenacity)
rune_page10_rune4 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeLastStand)
rune_page10_rune5 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeDemolish)
rune_page10_rune6 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeBone)
rune_page10_rune7 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeAdaptiveForce)
rune_page10_rune8 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeAdaptiveForce)
rune_page10_rune9 = RunesHasRunesPage.create(rune_page: rune_page10, rune: runeArmor)

rune_page11 = RunePage.create(name: "Caitlyn", user: atomic)
rune_page11_rune1 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeFleet)
rune_page11_rune2 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runePresence)
rune_page11_rune3 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeBloodline)
rune_page11_rune4 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeCoupGrace)
rune_page11_rune5 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeAbsolute)
rune_page11_rune6 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeGathering)
rune_page11_rune7 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeAttackSpeed)
rune_page11_rune8 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeAdaptiveForce)
rune_page11_rune9 = RunesHasRunesPage.create(rune_page: rune_page11, rune: runeArmor)

rune_page12 = RunePage.create(name: "Ahri", user: sarkox)
rune_page12_rune1 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeElectrocute)
rune_page12_rune2 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeTastOfBlood)
rune_page12_rune3 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeEyeball)
rune_page12_rune4 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeUltimateHunter)
rune_page12_rune5 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeManaFlow)
rune_page12_rune6 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeTranscendence)
rune_page12_rune7 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeAttackSpeed)
rune_page12_rune8 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeAdaptiveForce)
rune_page12_rune9 = RunesHasRunesPage.create(rune_page: rune_page12, rune: runeMagicResist)

#------------------------ Match History ------------------------------------------------

match1 = MatchHistory.create(position: 2, victory: true, champion: galio, user: sarkox, build: build5, rune_page: rune_page1, last_item: 3)
match2 = MatchHistory.create(position: 3, victory: false, champion: caitlyn, user: sarkox, build: build1, rune_page: rune_page4, last_item: 2)
match3 = MatchHistory.create(position: 1, victory: true, champion: kayn, user: sarkox, build: build4, rune_page: rune_page9, last_item: 2)
match4 = MatchHistory.create(position: 0, victory: true, champion: darius, user: sarkox, build: build4, rune_page: rune_page4, last_item: 3)
match5 = MatchHistory.create(position: 0, victory: true, champion: illaoi, user: sarkox, build: build2, rune_page: rune_page10, last_item: 2)
match6 = MatchHistory.create(position: 2, victory: false, champion: ahri, user: sarkox, build: build1, rune_page: rune_page12, last_item: 2)
match7 = MatchHistory.create(position: 1, victory: false, champion: chogath, user: sarkox, build: build1, rune_page: rune_page6, last_item: 1)
match8 = MatchHistory.create(position: 0, victory: false, champion: illaoi, user: sarkox, build: build3, rune_page: rune_page10, last_item: 1)
match9 = MatchHistory.create(position: 4, victory: true, champion: blitzcrank, user: sarkox, build: build5, rune_page: rune_page3, last_item: 2)


match10 = MatchHistory.create(position: 1, victory: true, champion: gragas, user: atomic, build: build8, rune_page: rune_page8, last_item: 4)
match11 = MatchHistory.create(position: 3, victory: false, champion: caitlyn, user: atomic, build: build7, rune_page: rune_page11, last_item: 1)
match12 = MatchHistory.create(position: 3, victory: false, champion: caitlyn, user: atomic, build: build7, rune_page: rune_page11, last_item: 2)
match13 = MatchHistory.create(position: 0, victory: false, champion: kayle, user: atomic, build: build7, rune_page: rune_page2, last_item: 1)
match14 = MatchHistory.create(position: 2, victory: true, champion: viktor, user: atomic, build: build8, rune_page: rune_page5, last_item: 2)
match15 = MatchHistory.create(position: 4, victory: false, champion: leona, user: atomic, build: build9, rune_page: rune_page8, last_item: 3)


#------------------------ Champion WL ------------------------------------------------

championWL1 = ChampionWishlist.create(champion: kayle, user: sarkox)
championWL2 = ChampionWishlist.create(champion: leona, user: sarkox)
championWL3 = ChampionWishlist.create(champion: yorick, user: sarkox)
championWL4 = ChampionWishlist.create(champion: ekko, user: sarkox)
championWL5 = ChampionWishlist.create(champion: gragas, user: sarkox)

championWL6 = ChampionWishlist.create(champion: akali, user: atomic)
championWL7 = ChampionWishlist.create(champion: ornn, user: atomic)
championWL8 = ChampionWishlist.create(champion: galio, user: atomic)
championWL9 = ChampionWishlist.create(champion: darius, user: atomic)


#------------------------ Skin WL ------------------------------------------------

skinWL1 = SkinWishlist.create(skin: drmundoSkin1, user: sarkox)
skinWL2 = SkinWishlist.create(skin: galioSkin1, user: sarkox)
skinWL3 = SkinWishlist.create(skin: dariusSkin2, user: sarkox)
skinWL4 = SkinWishlist.create(skin: illaoiSkin1, user: sarkox)
skinWL5 = SkinWishlist.create(skin: ahriSkin1, user: sarkox)
skinWL6 = SkinWishlist.create(skin: ornnSkin1, user: sarkox)
skinWL7 = SkinWishlist.create(skin: kaynSkin2, user: sarkox)

skinWL8 = SkinWishlist.create(skin: kayleSkin1, user: atomic)
skinWL9 = SkinWishlist.create(skin: yorickSkin1, user: atomic)
skinWL10 = SkinWishlist.create(skin: caitlynSkin2, user: atomic)
skinWL11 = SkinWishlist.create(skin: leonaSkin1, user: atomic)
skinWL12 = SkinWishlist.create(skin: caitlynSkin1, user: atomic)


#------------------------ Friends ------------------------------------------------

friend1 = Friend.create(ask: sarkox, receive: atomic)
friend2 = Friend.create(ask: sarkox, receive: gwaeb)
friend3 = Friend.create(ask: sarkox, receive: potato)
friend4 = Friend.create(ask: cheche, receive: sarkox)
friend5 = Friend.create(ask: furitorial, receive: sarkox)
friend6 = Friend.create(ask: lindorie, receive: sarkox)

friend7 = Friend.create(ask: atomic, receive: gwaeb)
friend8 = Friend.create(ask: atomic, receive: potato)
friend9 = Friend.create(ask: atomic, receive: cheche)

friend10 = Friend.create(ask: potato, receive: cheche)
friend11 = Friend.create(ask: potato, receive: furitorial)
friend12 = Friend.create(ask: potato, receive: lindorie)

friend13 = Friend.create(ask: cheche, receive: furitorial)
friend14 = Friend.create(ask: cheche, receive: lindorie)

friend15 = Friend.create(ask: lindorie, receive: potato)


#------------------------ Plannings ------------------------------------------------
planning1 = Planning.new(creator: sarkox, date: DateTime.now()- 2.days, title: "Vendredi gaming")
planning1.save(validate: false)
planning2 = Planning.create(creator: sarkox, date: DateTime.now()+ 10.days, title: "Êtes-vous down?")
planning3 = Planning.create(creator: atomic, date: DateTime.now()+ 5.days, title: "Let's gooooo")
planning4 = Planning.create(creator: atomic, date: DateTime.now()+ 8.days, title: "ARAM")
planning5 = Planning.create(creator: sarkox, date: DateTime.now()+ 7.days, title: "Urf is out!")
planning6 = Planning.create(creator: gwaeb, date: DateTime.now()+ 2.days, title: "Comme d'hab")
planning7 = Planning.create(creator: potato, date: DateTime.now()+ 4.days, title: "Jusqu'à minuit!")
planning8 = Planning.create(creator: lindorie, date: DateTime.now()+ 11.days, title: "Un ptit 2h")
planning9 = Planning.create(creator: sarkox, date: DateTime.now()+ 8.days, title: "avant le suivi!")

planning1_friends1 = FriendsHasPlanning.create(planning: planning1, friend: atomic)
planning1_friends2 = FriendsHasPlanning.create(planning: planning1, friend: gwaeb, accepted_at: DateTime.now())
planning1_friends3 = FriendsHasPlanning.create(planning: planning1, friend: potato, accepted_at: DateTime.now())
planning1_friends4 = FriendsHasPlanning.create(planning: planning1, friend: lindorie)

planning2_friends1 = FriendsHasPlanning.create(planning: planning2, friend: gwaeb, accepted_at: DateTime.now())
planning2_friends2 = FriendsHasPlanning.create(planning: planning2, friend: potato)

planning3_friends1 = FriendsHasPlanning.create(planning: planning3, friend: sarkox)
planning3_friends2 = FriendsHasPlanning.create(planning: planning3, friend: potato, accepted_at: DateTime.now())

planning4_friends1 = FriendsHasPlanning.create(planning: planning4, friend: gwaeb)


planning5_friends1 = FriendsHasPlanning.create(planning: planning5, friend: furitorial)
planning5_friends1 = FriendsHasPlanning.create(planning: planning5, friend: lindorie, accepted_at: DateTime.now())
planning5_friends1 = FriendsHasPlanning.create(planning: planning5, friend: potato)

planning6_friends1 = FriendsHasPlanning.create(planning: planning6, friend: atomic)
planning6_friends1 = FriendsHasPlanning.create(planning: planning6, friend: lindorie)


planning7_friends1 = FriendsHasPlanning.create(planning: planning7, friend: cheche)
planning7_friends1 = FriendsHasPlanning.create(planning: planning7, friend: atomic, accepted_at: DateTime.now())
planning7_friends1 = FriendsHasPlanning.create(planning: planning7, friend: sarkox, accepted_at: DateTime.now())
planning7_friends1 = FriendsHasPlanning.create(planning: planning7, friend: gwaeb)

planning8_friends1 = FriendsHasPlanning.create(planning: planning8, friend: potato)

planning9_friends1 = FriendsHasPlanning.create(planning: planning9, friend: cheche, accepted_at: DateTime.now())
planning9_friends1 = FriendsHasPlanning.create(planning: planning9, friend: atomic)
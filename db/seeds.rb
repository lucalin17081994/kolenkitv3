# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bestelling.destroy_all
Cart.destroy_all
ProductSauce.destroy_all
Product.destroy_all
Sauce.destroy_all
Category.destroy_all

Sauce.create(name:"geen", price:0,abbreviation:"")
Sauce.create(name:"mayo", price:0.55,abbreviation:"m")
Sauce.create(name:"curry", price:0.55,abbreviation:"c")
Sauce.create(name:"mayo/curry", price:0.75,abbreviation:"m/c")
Sauce.create(name:"speciaal curry", price:0.75,abbreviation:"spc")
Sauce.create(name:"pinda", price:0.75,abbreviation:"p")
Sauce.create(name:"oorlog", price:0.75,abbreviation:"o")
Sauce.create(name:"joppie", price:0.75,abbreviation:"j")
Sauce.create(name:"ketchup", price:0.55,abbreviation:"k")
Sauce.create(name:"mayo/ketchup", price:0.75,abbreviation:"m/k")
Sauce.create(name:"speciaal ketchup", price:0.75,abbreviation:"spk")
Sauce.create(name:"chilli", price:0.9,abbreviation:"")
Sauce.create(name:"loempiasaus", price:0.9,abbreviation:"lsaus")



sn=Category.create(name: "snacks", hasSauce: true)
pat=Category.create(name: "patat", hasSauce: true)
menu=Category.create(name: "menus", hasSauce: false)
ms=Category.create(name: "milkshakes", hasSauce: false)
bg=Category.create(name: "burgers", hasSauce: true)
loemp=Category.create(name: "loempias", hasSauce: false)
ger=Category.create(name: "gerechten", hasSauce: false)
pb=Category.create(name: "partyboxes", hasSauce: false)



Product.create(name: "klein milkshake",price: 2.1,description: "", abbreviation: "kl", category:ms)
Product.create(name: "medium milkshake",price: 3.1,description: "", abbreviation: "m", category:ms)
Product.create(name: "groot milkshake",price: 3.4,description: "", abbreviation: "gr",category:ms)

Product.create(name: "kolenkit menu",price: 9.95,description: "portie saté (3 stokjes), kroket, frikandel speciaal, 2 personen patat ", abbreviation: "", category:menu)
Product.create(name: "super de kolenkit menu",price: 9.95,description: "frikandel, kroket, kaassoufflé, 3 personen patat, beker pindasaus", abbreviation: "super", category:menu)
Product.create(name: "K-menu",price: 9.95,description: "2 vietnamese loempias met chillisaus, kaassoufflé, frikandel, 2 personen patat, beker pindasaus", abbreviation: "", category:menu)
Product.create(name: "vegetarisch menu",price: 9.95,description: "groente kroket, kaassoufflé, vegetarische bamihap, 2 personen patat, beker pindasaus", abbreviation: "veg menu", category:menu)
Product.create(name: "saté menu met patat",price: 0,description: "portie saté, patat en slaatje",category:menu)
Product.create(name: "saté menu met brood",price: 0,description:"portie saté, stokbrood met kruidenboter en slaatje" ,category:menu)
Product.create(name: "nasi schotel",price: 0,description: "nasi met gebakken ei en rauwkost",category:menu)
Product.create(name: "bami schotel",price: 0,description: "bami met gebakken ei en rauwkost",category:menu)
Product.create(name: "spareribs met patat",price: 0,description: "spareribs met patat en rauwkost",category:menu)
Product.create(name: "2 hamburger menu",price: 0,description: "2 losse hamburgers met patat",category:menu)


Product.create(name: "kinder patat",price: 1.2,description: "", abbreviation: "k.p.", category:pat)
Product.create(name: "patat",price: 1.65,description: "", abbreviation: "p.", category:pat)
Product.create(name: "groot patat",price: 3.2,description: "", abbreviation: "gr.p.", category:pat)
Product.create(name: "puntzak patat",price: 2.2,description: "", abbreviation: "puntzak", category:pat)

Product.create(name: "frikandel",price:1.35 ,description: "", abbreviation: "fr", category:sn)
Product.create(name: "grove frikandel",price: 1.75,description: "", abbreviation: "gfr", category:sn)
Product.create(name: "kroket",price: 1.2,description: "", abbreviation: "kr", category:sn)
Product.create(name: "kipcorn",price: 1.85,description: "", abbreviation: "kipc", category:sn)
Product.create(name: "nasihap",price: 1.75,description: "", abbreviation: "nasih", category:sn)
Product.create(name: "bamihap",price: 1.75,description: "", abbreviation: "bamih", category:sn)
Product.create(name: "bereklauw",price: 2.35,description: "", abbreviation: "bere", category:sn)
Product.create(name: "hamburger",price: 2.9,description: "nederlandse hamburger", abbreviation: "hamb", category:bg)
Product.create(name: "kipburger(halal)",price: 3.6,description: "krokante kipburger", abbreviation: "kipb", category:bg)
Product.create(name: "hamburger speciaal",price: 3.6,description: "zigeunersaus, mayonaise en gebakken uitjes", abbreviation: "hsp", category:bg)
Product.create(name: "hamburger speciaal met ei",price:3.6 ,description: "zigeunersaus, mayonaise en gebakken uitjes met eitje bovenop", abbreviation: "hspei", category:bg)
Product.create(name: "hamburger hawaai",price: 3.65,description: "", abbreviation: "hamb hawaai", category:bg)
Product.create(name: "cheeseburger",price:3.15 ,description: "", abbreviation: "hamb", category:bg)
Product.create(name: "saté",price: 4,description: "3 stokjes saté", abbreviation: "",category:ger)
Product.create(name: "kaassoufflé",price: 1.4,description: "", abbreviation: "ks",category:sn)
Product.create(name: "kalfs kroket",price: 1.4,description: "", abbreviation: "kkr",category:sn)
Product.create(name: "goulash kroket",price: 1.4,description: "", abbreviation: "goul kr",category:sn)
Product.create(name: "van dobben kroket",price: 2,description: "", abbreviation: "dob",category:sn)
Product.create(name: "kwekkeboom kroket",price: 2,description: "", abbreviation: "kw",category:sn)
Product.create(name: "mini snacks",price: 3.95,description: "2 kipnuggets, 2 gehaktballetjes, 2 mini nasihapjes, 2 mini bamihapjes, 2 mini kaassouffleetjes", abbreviation: "",category:sn)
Product.create(name: "bitterballen (6)",price: 0,description: "", abbreviation: "",category:sn)
Product.create(name: "bitterballen (10)",price: 0,description: "", abbreviation: "",category:sn)
Product.create(name: "pikanto",price: 2.15,description: "", abbreviation: "pik",category:sn)
Product.create(name: "mexicano",price:2.35 ,description: "", abbreviation: "mex",category:sn)
Product.create(name: "smulrol",price: 2.4,description: "", abbreviation: "smul",category:sn)
Product.create(name: "saterol",price: 2.4,description: "", abbreviation: "",category:sn)
Product.create(name: "sitostick",price: 2.4,description: "", abbreviation: "sito",category:sn)
Product.create(name: "viandel",price: 1.75,description: "", abbreviation: "viand",category:sn)
Product.create(name: "hete donder",price:2.5 ,description: "", abbreviation: "",category:sn)
Product.create(name: "kaas kroket",price: 1.5,description: "", abbreviation: "kaas kr",category:sn)
Product.create(name: "groente kroket",price: 1.5,description: "", abbreviation: "gr kr",category:sn)
Product.create(name: "luxe kaassoufflé",price: 2.3,description: "", abbreviation: "luxe ks",category:sn)
Product.create(name: "ribster",price: 2.65,description: "", abbreviation: "",category:sn)
Product.create(name: "loempia",price:3.45 ,description: "", abbreviation: "L",category:loemp)
Product.create(name: "vietnamese loempia",price:1.45 ,description: "", abbreviation: "viet",category:loemp)
Product.create(name: "loempia speciaal",price: 4.3,description: "loempia met pindasaus, ham, ei getopt met loempiasaus", abbreviation: "LSP",category:loemp)
Product.create(name: "kroepia",price: 3.45,description: "", abbreviation: "",category:loemp)
Product.create(name: "party-box",price: 17.95,description: "mini nasi(10), mini bami(10), mini gehaktballetjes(10), kipnuggets(10) en bitterballen(10)", abbreviation: "",category:pb)
Product.create(name: "party-schaal",price: 0,description: "mini nasi(10), mini bami(10), mini gehaktballetjes(10), kipnuggets(15), mini kaassoufflé(10) en bitterballen(15)", abbreviation: "",category:pb)
Product.create(name: "super-schaal",price: 0,description: "", abbreviation: "",category:pb)
Product.create(name: "kipnuggets(10)",price: 4.4,description: "", abbreviation: "kipnug",category:sn)
Product.create(name: "kipnuggets(4)",price: 1.8,description: "", abbreviation: "kipnug(4)",category:sn)
Product.create(name: "kipfingers",price: 4.4,description: "", abbreviation: "kipf",category:sn)
Product.create(name: "mini nasi hapjes",price: 0,description: "", abbreviation: "",category:sn)
Product.create(name: "mini bami hapjes",price: 0,description: "", abbreviation: "",category:sn)
Product.create(name: "gehaktballetjes",price: 0,description: "", abbreviation: "",category:sn)
Product.create(name: "mini-kaassoufflé",price: 0,description: "", abbreviation: "mini ks",category:sn)
Product.create(name: "vlammetjes(5)",price: 0,description: "", abbreviation: "vlam(5)",category:sn)

Product.create(name: "bonita",price: 2.5,description: "", abbreviation: "",category:sn)
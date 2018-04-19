require 'sinatra'
require 'sendgrid-ruby'
require_relative 'produce.rb'

include SendGrid

get '/' do   
  erb :index
end

get '/cupcakes' do
    @allcupcakes = Cupcake.all
    erb :cupcakes
end

get '/eclairs' do
    @alleclairs = Eclair.all
    erb :eclairs
end

get '/cakes' do   
    @allcakes = Cake.all
    erb :cakes
end

get '/macaroons' do
    @allmacaroons = Macaroon.all 
    erb :macaroons
end

post '/contact' do
    @name = params[:name]
    @email = params[:email]
    @allcakes = Cake.all
    if @name.empty? or @email.empty?
        redirect '/'
    end
    from = Email.new(email: 'olgaboiar@gmail.com.com')
    to = Email.new(email: @email)
    subject = 'Bakery Catalogue'
    content = Content.new(type: 'text/plain', value: @allcakes)
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.headers
    erb :index
end

cake_one = Cake.new("Raspberry Fields","https://scontent-lga3-1.cdninstagram.com/vp/a7b9ed6cfec85b8a6bb91f3d95f52479/5B707286/t51.2885-15/s240x240/e35/c0.135.1080.1080/18722600_276714382792358_7154794359785783296_n.jpg","50.00","Vanilla crème fraîche cake layered with raspberry Swiss meringue buttercream and lemon curd filling, covered with raspberry buttercream","https://scontent-lga3-1.cdninstagram.com/vp/818c868236993a790216503c06d4a888/5B52C88B/t51.2885-15/s240x240/e35/c0.134.1080.1080/18094918_1094972283942723_7502973386943889408_n.jpg")

cake_two = Cake.new("Meringue Queen","https://scontent-lga3-1.cdninstagram.com/vp/a4c551742cfede18fb936962b3aac7aa/5B6835D4/t51.2885-15/s240x240/e35/c0.135.1080.1080/21227093_208599499675393_3173282182298861568_n.jpg","56.00","Chocolate cake filled and frosted with vanilla Swiss meringue buttercream and chocolate cookie crumble, topped with a bittersweet chocolate glaze.","https://scontent-lga3-1.cdninstagram.com/vp/7e8755c0d807b850d60bbe04bedd3e5d/5B5F05B1/t51.2885-15/s240x240/e35/c0.135.1080.1080/21371948_1829136157100825_5778210856986738688_n.jpg")

cake_three = Cake.new("Holy Cannoli","https://scontent-lga3-1.cdninstagram.com/vp/3a7d3129b21eaa3f121e583b36144817/5B74730C/t51.2885-15/s240x240/e35/c0.135.1080.1080/21433543_125397774775036_4691693893282955264_n.jpg","65.00","Vanilla cake layered and frosted with our cannoli cream filling (ricotta & mascarpone cheeses with a touch of orange zest & rum) and sprinkled with semisweet chocolate chips.","images/cake.png")

cake_four = Cake.new("Love + Flour + Coffee","https://scontent-lga3-1.cdninstagram.com/vp/1373251aa75335f0a3937853be16275b/5B72B970/t51.2885-15/s240x240/e35/c0.135.1080.1080/20759463_339331916516793_553287947747590144_n.jpg","63.00","Chocolate cake filled and frosted with coffee Swiss meringue buttercream, topped with chocolate-covered espresso beans.","https://scontent-lga3-1.cdninstagram.com/vp/341859b39541f0a84b0d36d5b5bbf643/5B5C9F04/t51.2885-15/s240x240/e35/c0.135.1080.1080/20184831_124548984824848_6413904276363411456_n.jpg")

eclair_one = Eclair.new("Lime Angel","https://scontent-lga3-1.cdninstagram.com/vp/a94edd10d44b31fc424cc6ab3a8badf1/5B6F8B20/t51.2885-15/s240x240/e35/c0.135.1080.1080/23161479_383559492073257_5037711246221115392_n.jpg","5.00","The perfect summertime eclair filled with zesty kiwifruit curd, aromatic coconut and lime pastry cream, and fresh and juicy kiwifruit.","https://scontent-lga3-1.cdninstagram.com/vp/8febf539934cb99830413e87fe8a52e1/5B5CB32E/t51.2885-15/s240x240/e35/15258996_1384480028231020_6108056721752588288_n.jpg")

eclair_two = Eclair.new("Coffee Addicted","https://scontent-lga3-1.cdninstagram.com/vp/c32191f097b98eaf5f5489beec303726/5B6CA20C/t51.2885-15/s240x240/e35/26374272_174233573342789_1836733890731966464_n.jpg","5.00","This twist on classic chocolate éclairs pairs buttery pastry shells and coffee-flavored pastry cream. The rich chocolate-espresso icing is a perfect final touch.","https://scontent-lga3-1.cdninstagram.com/vp/08daf6189275d8af832f3c34021cd75b/5B58B4AD/t51.2885-15/s240x240/e35/17439044_620158154841798_7665601357239287808_n.jpg")

eclair_three = Eclair.new("Matcha Lover","https://scontent-lga3-1.cdninstagram.com/vp/5f3539340f3bd68c84904e0ca726a898/5B6EEEAC/t51.2885-15/s240x240/e35/c75.0.930.930/16122724_1851512705132450_4133251091426967552_n.jpg","5.00","This lemon and green tea éclairs recipe is our interpretation of the signature challenge in the Pastries episode of The Great British Baking Show.","https://scontent-lga3-1.cdninstagram.com/vp/99fae57af3fc6de97a11dc91b404c566/5B659B21/t51.2885-15/s240x240/e35/15534968_1763772353948586_6673342334224039936_n.jpg")

eclair_four = Eclair.new("Raspberry Crust","https://scontent-lga3-1.cdninstagram.com/vp/e33d24bd08d4fc65279ae69806cb8d76/5B5DAFD1/t51.2885-15/s240x240/e35/13584236_1648439255402884_1452009893_n.jpg","5.00","The Chefs have combined the sweetness of the raspberry with the finesse of milk chocolate. Gold powder adds a sparkle to this gourmandize that will please anyone with a sweet tooth.","https://scontent-lga3-1.cdninstagram.com/vp/5dcf82e0f642a8909b762d4b9b583beb/5B5024E6/t51.2885-15/s240x240/e35/16465826_1287967484617795_1005738670499561472_n.jpg")

cupcake_one = Cupcake.new("Fig Pig","https://scontent-lga3-1.cdninstagram.com/vp/826bfcb54f4741aacce89feab1de2499/5B567D44/t51.2885-15/s240x240/e35/14504736_1201333609940041_5534646053359321088_n.jpg","7.00","Fig and Honey. Our brown butter vanilla cake filled with a rich and citrusy fig compote, swirled with orange flavored cream cheese frosting, and topped with a dollop of fig compote and a drizzle of honey","https://scontent-lga3-1.cdninstagram.com/vp/c9510536dc853177f07b10632a6ae18f/5B74F22B/t51.2885-15/s240x240/e35/14369025_578360365688978_959568612_n.jpg")

cupcake_two = Cupcake.new("Strawberry Addicted","https://scontent-lga3-1.cdninstagram.com/vp/5695e6329385b37c90a0d5668385efce/5B5504D6/t51.2885-15/s240x240/e35/18947824_1736650386633998_8079091662850097152_n.jpg","7.00","These Strawberry Cupcakes are soft, fluffy, moist and deliciously strawberry! There are pieces of chopped strawberry in the cupcake and pureed strawberries in the icing. No artificial flavor here – all flavor and color is from fresh strawberries . Yum!","https://scontent-lga3-1.cdninstagram.com/vp/5375a8ccee5163f9dd5bfcc7f29f924f/5B5ADAB1/t51.2885-15/s240x240/e35/19050259_1233068756804523_1766524970877321216_n.jpg")

cupcake_three = Cupcake.new("Blue Lagoon","https://scontent-lga3-1.cdninstagram.com/vp/b983e454eaacd4ce1fb5a88d6ddf27c5/5B58E3C9/t51.2885-15/s240x240/e35/27576506_594005800942620_4655893567049302016_n.jpg","7.00","These blueberry cupcakes are breakfast for dessert. Fresh blueberries are mixed into vanilla cake -- rather than muffin -- batter, which is then topped with cinnamon streusel and swirls of blueberry-cream cheese icing. This recipe appeared in episode 308 of Martha Bakes.","https://scontent-lga3-1.cdninstagram.com/vp/7712736b2c5b18431c1d4a26a8adbcf4/5B4F0BDF/t51.2885-15/s240x240/e35/29418203_222295181654971_7766891031269736448_n.jpg")

cupcake_four = Cupcake.new("Mango Tango","https://scontent-lga3-1.cdninstagram.com/vp/457ae2d6813c8846887ba0bfc7918ae0/5B58462F/t51.2885-15/s240x240/e35/c0.135.1080.1080/27891608_153114748712016_3985731037962436608_n.jpg","7.00","A moist vanilla cupcake with a hint of coconut topped with a fresh mango buttercream. These vanilla cupcakes are rich, buttery, moist, and have a hint of coconut from adding the coconut yogurt to the batter. The buttercream tastes fresh and sweet, and is bursting with mango flavor.","https://scontent-lga3-1.cdninstagram.com/vp/203ba0a4f30354237d3042a00dfdea70/5B6C41B2/t51.2885-15/s240x240/e35/28156501_216672038888144_2682609708061163520_n.jpg")

macaroon_one = Macaroon.new("Chia Bliss","https://scontent-lga3-1.cdninstagram.com/vp/6c51bc9cf6fce6a9d9a30fe88c8f4220/5B5E2D25/t51.2885-15/s240x240/e35/c0.135.1080.1080/28752487_280937639109109_1501679768234360832_n.jpg","3.00","Fig and Honey. Our brown butter vanilla cake filled with a rich and citrusy fig compote, swirled with orange flavored cream cheese frosting, and topped with a dollop of fig compote and a drizzle of honey","https://scontent-lga3-1.cdninstagram.com/vp/ce5e4fcf78d82832538533e7ea7ec1e8/5B7140EF/t51.2885-15/s240x240/e35/26066664_411767139253534_4179230168029593600_n.jpg")

macaroon_two = Macaroon.new("Blueberry Dreams","https://scontent-lga3-1.cdninstagram.com/vp/f1c510b3a5b57f4e0c6ef924308f1b23/5B6E8A09/t51.2885-15/s240x240/e35/c136.0.808.808/28750911_413119529141310_3036651374168244224_n.jpg","3.00","These Strawberry Cupcakes are soft, fluffy, moist and deliciously strawberry! There are pieces of chopped strawberry in the cupcake and pureed strawberries in the icing. No artificial flavor here – all flavor and color is from fresh strawberries . Yum!","https://scontent-lga3-1.cdninstagram.com/vp/649f0c014dce73836c2e0bea9725789e/5B567502/t51.2885-15/s240x240/e35/c0.135.1080.1080/26183296_1237177876384093_1660419899773681664_n.jpg")

macaroon_three = Macaroon.new("Rose Petals","https://scontent-lga3-1.cdninstagram.com/vp/5d986c7314693be9346db7098b9f63e5/5B565433/t51.2885-15/s240x240/e35/c181.0.718.718/26361972_157033131616739_1546551482008993792_n.jpg","3.00","These blueberry cupcakes are breakfast for dessert. Fresh blueberries are mixed into vanilla cake -- rather than muffin -- batter, which is then topped with cinnamon streusel and swirls of blueberry-cream cheese icing. This recipe appeared in episode 308 of Martha Bakes.","https://scontent-lga3-1.cdninstagram.com/vp/b3aff5193a932c213f3fe23a3b9a4abb/5B54B44B/t51.2885-15/s240x240/e35/18722060_972598749542066_8962009094911164416_n.jpg")

macaroon_four = Macaroon.new("Lime Crime","https://scontent-lga3-1.cdninstagram.com/vp/4210941a65514dbc2f49c1294814d2cb/5B690D1F/t51.2885-15/s240x240/e35/c0.7.1080.1080/19050616_320264788407849_8432079584500908032_n.jpg","3.00","A moist vanilla cupcake with a hint of coconut topped with a fresh mango buttercream. These vanilla cupcakes are rich, buttery, moist, and have a hint of coconut from adding the coconut yogurt to the batter. The buttercream tastes fresh and sweet, and is bursting with mango flavor.","https://scontent-lga3-1.cdninstagram.com/vp/55967af585392000e405037446f954b2/5B752667/t51.2885-15/s240x240/e35/29418308_230261097525570_8062244464652976128_n.jpg")



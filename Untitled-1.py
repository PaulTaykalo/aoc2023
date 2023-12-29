#!/opt/homebrew/bin/python3
# Input string with the matrix.

# Heatmap gradient from red to black (1 to 9)
# We use ANSI escape codes for coloring: 31 for red, 30 for black
# and a gradient of colors in between for 2-8.
# Each color code is prefixed with '\033[' and suffixed with 'm'.
heatmap = [
    '\033[30m',     # Black - 1
    '\033[34m',    # Blue - 2
    '\033[94m',    # Light Blue - 3
    '\033[32m',   # Green - 4
    '\033[92m',    # Light Green - 5
    '\033[33m',    # Yellow - 6
    '\033[93m',   # Light Yellow - 7
    '\033[91m',   # Red - 8
    '\033[31m',     # Bright Red - 9
]

# Reset color to default
reset_color = '\033[0m'

# Input Matrix
input_matrix = '''1XXXXXX122221111223212131233223113223121333442231421433142332434134225233545342212211333112344344134442142433223412123123222112313121212221212
22221X221221231312321313313211342343411142324XXXXXXXXXXX4452332445155511344312331454432211221131443421221311311132313213121113133212212121121
12212X2221231231121333333232224342XXXXXXXXXXXX324143142XXXXXXXXXXXXXXXXXXXXXXXX35121513351133144143322231342334223133211113332223112112212121
12112X1221232213231331331241213133X4444133314314111435332133355334444335454224X12242224554224323414441121443212123222111111321321211121211212
22112XXXXXXXXXX2321313331134242424X3333242343434255431431524222114514555335533X41355541521354112112323124134232112232412122113112231321212221
12211211333211XXXXXXXXXXXXXXXXXX42X2334131115345325525553252224253442114313554X4XXXXXXXXXXX45541224124314212142143231424133222231131333222211
2122122133213321131232423424113XXXX1433442125134332211522512512135134454413433XXX555542522X25543342113244321143124141111333313212212211321211
111222113233231131222412143432342332212424325445154122325221333315223121441513551143423434X21424535543443413414433343312211133122213311321111
121122211212132122314144412132113122134521143321315442521141334521433553332314111441535455X12441221412133441223422412413323113211321312211211
121123313221131212422134134333321412515231255135114131115445421335451435423235211523233534XXXXXXXXXXX5332444243321231442133141331131331111311
1113211113232231322233241414313143532423113131554333312324155124254536456322254434234451333511225554X3323232212313234221111112322131222113221
2132132332322232211442222143334344545132145444232552314331534436625436663424626365434333344454145451X4133442433314231223211422211322312332323
1112211122232322431221223214212122412451251144545225223655434656565466422242636355565426422322145542X5131431244342333332222233433111112222223
2333122121131234121432311243234222443351321532445224266565254643423663644224433564242334646214555343XXXXXXXX541431411413441431421111131232332
23321111333313142133344332115135134444411342324424264633256666426622255645546652435424264424533555523223443X443223513323443142441123222111133
31211123311331134141441443123234232321453145554555356665463525633355242526634542236565632452632642554115154X544212511221434432244122222322313
13133212213131411111432313324145124442352131135423342523652462246555544553656534243556533656332543251415322XXXX314214123332331434141311113222
23123131122233141232413215412135513332153223453434336346626654235566243433436344255324422422435256463251551342X333425211241232312424422121332
22331313321412331412434211135311533251244633363534664435542536442323625633343543242552644423666636246433134323XXXXX53453142224341133421111313
332113123232234221124212545411551211254546423543323364625245243255345523262644624325265253334354625244354135354511X21431232413344232242213122
233323232121141443421251534243342514544532562336364566523455335463363576553654232523234463556234455234422132255555XX1315532434442233422312122
2121322321442344221342452432551123455243525525424554534432255653455774745477675657553452564335546336535466412424213XXXXX522223434442124231223
12332141343413122223442134455341133424522635662543523365657756655333774674474363577437532654255254322346422351411443513X312133323313214422112
33131143321242441232455345511314154252323624654655244437554346744756643434677564734634663563635536265452564423553334234X445333422114144332112
12231342243233324353514141211122656624436324546553366555365773756655556447564456546744654534325425463233656324341254353X354334143232242421231
22233444314422432151432245412346264322642436223557473344637773744464367563637565345665573377654346333342264653645311254X535215124231432144411
11344214424232333235415454432533564222535226566337376443444665367543354773543536547664764564775443225656522622365111554X155254311121212212243
11331312414343421134542515443532664262556465645734644737754776567663465465335737464377335734544663553345656466362245444X423212422234234322433
31322224233141451441344425555525325323465622745643377557755774535363434437733543645567737674445636756462623452534652341X234531444111124123231
23412442421421152412335222462623332534552466447337353577334765745643656535755337556367745567543456462245355653622334331XXXXX35132434143343241
314223324221211151133432356545644332443347777536754354374665345545747757547557536636455566356777634676343653623666253552425X51125111313124133
411432414444422443515413332323655623663677673645546774756743445545884584744568887546563435746377776743354365536655346324314X34524212431312341
112244323223411445151512662434565532454734755653547347767358748877755884777648584548653743775573637777554466525633426251432X31415131122244131
331212134433452323233434542562336565263344644744333575576784744686467788544678847876764347776556673434767726536235644342145X54533443223141311
144223143322414541141526263242263466435443573476757354555687486788744755578445677587574655755664654345446634545543225643112X44243425544243214
211211133311315353455524632446523366777546655477466388688487754875444878458554748868687674647735745546477555655535423234422X22223422214122332
233323332451434545112243556662225233665445763747333558657577647644677878675688446866665464776546644334363437442454266655343X34213213321233324
231312413341215423223635646634566355537566476444388687576655766687788565766688684447666678646537343553547554455643546642542X12435344351423122
313223325341552155426532255526425546547737657655545485445645644747875684466476788564646675675847676434367747353455636325554XXXXX3444524434421
3131232332421523345255665325456653443754733667556554875845575684655858477446864844464444875578577663366743547432624562255344423X4142434414413
4314311242411412122632546432626737464333754665886778584656648755574855545847666578474586654747874743545373645776263644435522244XX324243433213
22132131453155413452334444656453745573373663468768875544757754488756967858567744746464788547876854763645346363363354224344523515X222312232431
13113411513524155453642225622446456474666766865875847886787565858699559896677987757855865887576474757733656433773434646226454512X321353322413
12342111415211512345256565556665735544345456454686577458764957859897859965599985858544748877478557655334637576754545252365344515X135523321234
22442243142555342362246232563734363477673767774446446446759869697999786769689875658598456647646688567433643535545575332232343323X411545155312
41431135243512426322344445563574546747666488746478574856665686556778687778765885885977774448756865686753637735347645234626255622X511521225443
22311415334534324655465666335453556356758565568587655597968978877785568876566789688978665758646468787847747736535674332523663531X242532412242
12312232543222532552236254477345374373646457848474865866666598589978577588688857979568988588585484774864773773746743433223533465X541341553334
44335214321453226345355442765766443673545886578667665557976889668978998698795987595975556987776747755754455633677757645364435456XXXX451251512
12145241325131224254633233663333737375678868755576696856596897966678799796859786855687758687665648587778665335463356444246344236254X244125224
42412454153545264344525247637767635437487544557488585787898798765765555688958555597579567796665464768675757543665663374225446333525XXXXXXXX44
442231145454245523353645554743563557867448558568969796957867599569966898697686599585997577896864466476674577455436764545262645522432355145X13
233354114345336444533456437343457777658566566456877668559598895867796987768986685767756566857885755778745887467765644633562255433431234351X43
324253342114343544244534675743375535768786586887668888886795977869879878866769698876985686759796678654768474747557563442633532665644452515X54
114221444443244223644424366376364386648564655896586789898968767796786977779787696888599798697978788567677757666633534565646253566451334212X54
231324515512325242535245455467675768588854567989787886666878776967999767878879879979996998665685875667865886455364335677254455642324552234X25
123335241124524366456344746675645476445445564767797955968577686666686667788996777698895868778677795767786486845454354747562263264622152553X42
231312152241525364542236367736373868458667666779885897585667886777666696769996697899878976676998677778578677886463537647626326654663511112X43
331331513311444364256353367734745744545664856969878699566968868997779887978889766677897775886779767476578544443633553536436626625345313454X21
311541535146254465342645333566578678568468487678685879887799978886979689787667788999676767566578997656474678758355474646655262523522152524X31
451251515414632223243357445374375787644478567996798579778668797886877698979789768899788686758566669664576746684677667734554226323432313522X44
312435235356534526643344674354564688886666767659955698886877689967676778876696679986799865887856759577778867444534473534334252443642442551X12
315222511556322242562347537534678876487554978596598969689897699688888889888986769669666697798777697575588744547554556557366454224542353433X53
425515431314443324446456745644487668777765897686895879799686896697779989879978988786779898678757569666776745678873556477463454524525151442X54
131431325313553226425634656745565844664566576586556979796877886679989997978989987667666976655865988864865656775744335663443624652436424325X31
331152143452533542664477374777485676554479868958665977868688897897877887987997896899887967697857559567767655574573444337555653226566254113X33
255253351164333322455334454735364887645786757955765868767899867977879879977989877699786799988987876687644786656753774437344362634226212342X23
341325252336244465354535753473368785645846688777855996896698888778787787899797988879866967688798779898487758847847636774576563352656341411X35
412155212433254555566676547343356768875455868866568967667697889887999797977897778886989999666596889665865858768577775545342446542456534425X41
511435114262464254434567436757745848466689665575568686766977899878799887898799787898779988976858986899585846555764436555672646532255213214X35
235135235456433443255643733544444586687565798557565898666868877777977789899899879876896676779975778859887665874733467535353655622336411132X54
355221152564242253526675554634758687685569665798667968999689998977799898988999979779689668679588596899447685845873474455345566623253441453X25
14451553523235444322364446663564854555865558776875897879669888797879797988878787796688979977976977586848858666845656374657445335262461154XX45
55123114242324422335346433553775765477754655875666577968878979778897777888789879977986966678985979987988848874645446777567643654226323513X445
52254352543655663565473546673658655848585597965995879969967776777788897879778978889789766686779759996987757666564573435643324652623334313X513
15121534545243366246357356764637674754474857679858988899867776978787797887777778999678866768558657858757686864687463443664645426532223543X555
43321225125426252236463574574338886488645575888669896897777966698878979799778879696676867896687888856848485477646375734664543555346531355X322
54413215131256232322576756763344744785768975897559688966778997998777987789788998989877688885975868895765558885544365747747356566454321442X442
13253352245444366456355364654658478454486759687876566687769887799989788977799977879686786999969599869846668587576673364633543545653413323X411
43114231234452252445247763756758855547468895895986859696967699887997898789879768898998686668597565655455874668786545356635353565565312324X131
11545511434626334346574477656733885556464857988956985786998777887688978887879869776686897968999985785877888446677433643357266236352631232XXXX
12442314223224644265375564736336587776786789775666857599686676768788688998778979796779896995875699766854767846674645444353232323322635523534X
23253222321626456433344376667555544484465545888559598798999667969976677687888898866789987698558999964577888554643766557653545635664243324255X
11243552253654532646344474775657677885577777689688557866896786699879876767678969977689696779966877775645777778634564743762542532526251415243X
14125532143443636443456777657347576487848848787968768575889789777969996867799779986897668865796989646484486788463744355636633656424345453531X
11153444132565266566444656667434484844788754789767786796868787997669887888878677798896877698788658677784648555434636673355653355262412325554X
33132522125433333664346737536745437485465664465568597699989686666977896879989696977865668878765977775648784445547733746443422523543135314124X
34152451414546544244363643765536666567557454569889688698759666897699976796689898696898989767669658486546666774465634744322263665652345523532X
34152524552144633255364646347454366564565647686878699585756577678789966977779886667879978959976697687854545674545645443463664244645454413454X
43121255145444356354354634334776475488548785864989767695698886677978768787686976765598555958757688455865767867354635375555363546425352231135X
44222324541343635336554577747545456654878677555888788957577565986799776989897685779658699699858545886745478443354453433636562643644354211432X
41252111453425633355356325365734544557857474888496689657999955658698678768887596565689988656588668766465457634637344634653334534242514425354X
14113424421551343335624525573664575635857676567687955857888775958965565999965959765988699978666667556858446753565475366224554524224433143332X
24112421231441232442233346456677447657855555574688586796866876579557777786855965958765557595975576546587473734377475356236642663552543232442X
34432145452254334255534265676455367765674475767476478599587757885798866667557556755859589999844585784858774566374537742432262222541221155111X
14232154553245152632564254747775756637856586876455756866686696679886987569866679759856685865566445757566436436763746354566243634523354345524X
12132513253322542453426466333357567577747778476465588579655857987956568995975556596888885456746446758466475643676345432264333534513453332224X
41113214553542542654564656655474754766735846887688585489789869696555979795965988878665697884476544568553774747753454653555465364134541353544X
44322424253321312254554322363573377436343688756477767876499678667755756956878866969897478768887844448876776543634746232454344641452254551432X
2131125241414223256322225564633363334577538456474546586448659779897797895596889758974758448447667545657773444636645522244256544443531225XXXXX
1234434324122525245642553622527366433467555888664455766566787486699857588758677685445644678848744887567355766535454645562633432311231115X2321
2113233414251433245325355223347576777374743756675546548458784487896765755595657558446754578764748467476467577374656422533342342241553355X3414
1114321112511445122266235332542375357546635754856755447658874854845674867674884787774445764874758754576447454437354426445555444542531335X2231
3331323441434454114442423235533646443654644443677786768865566486546654664447444546558458654645645366364777636435546323235225555315341443X1442
2443231225521314432255443353443427677634745774368664756447685747554564444658584476884686465858547776763746475464526224553442221134211432X2122
3422311412155525143532364635636326653743377343644688658685464558885575474868664888675748844868763764436357543622342345334212232444533424X4434
1231241221152433542536335434344443674644636773355365677484754458546786578576867787548756785547647643447443567532323246455435521341322323X1413
4123222223352335342245246455432634367735645333574543848445658557877557566558576565567754476573564653764445745353256436552322244132442424X2241
4421243313514534531242323524556445544334575745756543674475474446444847645577877676785655835554463446474633353345655445451345555143434211XXXXX
22243131241213331341454434336322534526333735747754335746687645657855787587756457477686357756364554653357773464423544565343322311555541312322X
13114231142432513123141562654556552245476575645443363335565478644556874885767755574677355436676544574555452532662225436335325144112231311243X
33233233314144415345334226625443622656264634763456563476637574466675475575774747345355546757644547457672653222533456235331145511125324442143X
22444423114124344311422124656332546632363757676433765675776675543556437774553575744455464473374554376645535555325253633413344323222313334321X
13343313313343251222314155133454555642362326736776754477734647667753334544734475364436454656364445642443623255443462333455532153142213214443X
11323312441222445112411321545564625464622222576746747574565774643654645574563766574355557367546673543365453562352254314354125241213334421313X
11331311321131233351115455234436332656255454653746666574457645764755434665673475637465437777654554523564464666426251512441331242114121312132X
32222242134222221425223221522143542262636345426463454563467666344635777367374757335665737757636745544562463265542543425522352232411112323314X
11132213133134324515345323245526235463224332444256744546476437456346635656343343756676353664543645665665344333223553412552152223314434312122X
13332412333231244433123422544214425526535264624453225357544546674774455675375653434553344353423665536262222536335432312225513434433434143XXXX
31331412343444212433133411514344155365622443446333643376364546465656477355345476575737775543362355465455624262125314234222442243344414241X222
11323242323144323121551231255532422522253525522454244236263557734544647635543666777337663265234323452345423443255544215143434233333423433X133
11122111122323344344351312141231442536624452334334336334654237746536743577466477366634234246445463446565636415251533214233123442434334111X332
12312313142231232224413451521444115425462633632544253654426262632642565454524635232225662234556545542565413244534344322133444344234433213XX32
321223131221322223424321343535452552544643563425665663523652322466242442625366465252244445533355526523361235252141251151443433442124111112X11
311312213323313332331111342422441335255544255533622536525426325635454556233265652646556652264344664363441313232433113353213111311112332132X31
212322231122222112122432215115412133452444143534343236642464362242254462346523633246526625322335356435211312122232452444222133334414213221X13
121221313222313433332143242344531312422454351362665223243633332665344332342636353543543423256355435554115254431122425211324233313242312232XXX
22322113223333132311114431212554525523455554513233636224236546654324543365266645532254242532333525145251524324553254412444234312233333133332X
12322232223324311221411313312352433314535334425323264362425356533266644425655634364332322363662421431311323435335341213244323222433122132132X
11222323113223221411244112443341222313151144133214423655562453362532663525554425343632556522542235143333431442341134322422232324231211131213X
21113122133331111121341143234122415412312313321351543156656464666244422252232425344452262224414445415442514232434114433142124444322321321323X
22211112213223222444232434412412212314522412513233515543512634553456566362545232546532355435222122425223224435422323312324314313231233121223X
22213321211312323111122413421212215352455433333354521331115311553552542324264244224322542221424454244541332542432332312131242232213222233231X
22212321321321323232133132411442244344531232513524424341245543433435431123523543145543155434312514251155535343133314321332314331112113232231X
21121333332211311132224344122444122433142343234235425331214545124241325411355225554133321112242433332252322433223433124122332332332233321222X
21111223133121312222132214221131442142315255213325142431443124545533223514421242551233121343422553451132333423314244312442313222232232222212X
21212211121131231213131121244442211342112221435113412532322144145334125352132441355223251323513545255214123421133323341321333333111211111221X
11121121123323222123133223424114323214212423131415223224115345252545112532442342535354433454423312532131312422233143121222223112121332222122X
12121111213213331211312121433222143132224342111221115353311151223454433211325233243243234545433411321321323134144333423312312123113213212211X
11122212123221111323121231333241331244123222114231311333424235331321124155425225532144543511141222332134212443112424232221212111111312112112X
22212112222113231333213231123132431242133334121423134325124451115323334442421222414545551344244431431344133422221113213121122113332221212221X'''

# Split the string into a matrix (list of lists where each inner list is a row)
matrix = [list(row) for row in input_matrix.strip().split("\n")]

# Function to convert a character to a heatmap color
def char_to_heatmap(c):
    if c == 'X':
        # Bright white for the X
        return '\033[97m'        
    else:
        return heatmap[int(c) - 1]

# Render the heatmap
for row in matrix:
    for c in row:
        colored_char = char_to_heatmap(c) + c + reset_color
        print(colored_char, end='')
        print(colored_char, end='')
    print()  # Newline at the end of each row

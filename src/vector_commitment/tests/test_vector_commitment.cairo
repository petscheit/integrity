use cairo_verifier::vector_commitment::vector_commitment::{
    truncated_blake2s, VectorCommitment, VectorCommitmentConfig, VectorCommitmentWitness,
    VectorQuery, vector_commitment_decommit
};
use core::debug::PrintTrait;

#[test]
#[available_gas(9999999999)]
fn test_truncated_blake2s() {
    let x = 1157029198022238202306346125123666191662554108005;
    let y = 129252051435949032402481343903845417193011527432;
    let out = truncated_blake2s(x, y);
    assert(out == 642191007116032514313255519742888271333651019057, 'invalid truncated_blake2s');
}

fn get_queries() -> Span<VectorQuery> {
    array![
        VectorQuery { index: 8944, value: 1157029198022238202306346125123666191662554108005, },
        VectorQuery { index: 87688, value: 1156474867121067569936479332616669839586441580873, },
        VectorQuery { index: 102053, value: 525816285038390391761216558389282806925768838548, },
        VectorQuery { index: 245879, value: 107369622883479077497054209983678141110627796717, },
        VectorQuery { index: 256809, value: 949339871326160796951462878182560128992821726454, },
        VectorQuery { index: 392242, value: 1059124283686490920098445863728771935957073029275, },
        VectorQuery { index: 440172, value: 1004960524734674416414422271912833502843388467741, },
        VectorQuery { index: 548787, value: 411837609286176947519179656958589815774812246499, },
        VectorQuery { index: 577284, value: 1218039613838712880752380339674108515816375625719, },
        VectorQuery { index: 642763, value: 1265919886333784475948846562913903139069733976148, },
        VectorQuery { index: 756331, value: 896322243196765520299757197377168495469457128757, },
        VectorQuery { index: 864292, value: 1155461141686855272442638920387236548699741992582, },
        VectorQuery { index: 887991, value: 1022535991370990930332590451711848013554441682785, },
        VectorQuery { index: 918820, value: 224038758314235415917884799763993555998811070874, },
        VectorQuery { index: 931416, value: 505599032726154718331451347724946473511894248513 },
    ].span()
}

fn get_witness_authentications() -> Span<felt252> {
    array![
        129252051435949032402481343903845417193011527432,
        1225462692330827760978713557642008436414090898865,
        67278565381239641413204827679887695736774949722,
        1078737717881769867930343257891164653408549478967,
        699890010136795418357117423249809483421135104011,
        1246725019495457082404930310201117186225574274808,
        723869797280768133619441460202235386787293092423,
        1065705212454360682518628382427562287270474022017,
        132595479574670041812174530172942470686780741377,
        115204718186786809942616812806473344950571253985,
        174494651288798776983066705991272364346692942282,
        1144214219004314557441377864651829949041601374916,
        1144737824385908743128900179556770453136927471451,
        1324666863329091299627640371062328029507747786540,
        400033442185649920227240137265193691762114243870,
        929556168503307423697654578587105824549232375013,
        992473586222458822718584294390418372763339729490,
        559508766994081021959582568425445270940875089230,
        1457966172391082807647461191887436468448874921400,
        374685932446416860702177528029688824704652771918,
        722140008860956153474204736531617486044303706374,
        337722875347521152970485245152695697802284782753,
        76010873097836317324289623471464500411232434976,
        1205000356605622625443139319902766366558189706253,
        584545402305080207884674795412779962516690190794,
        1336543663070328359671498017960496366794041172263,
        693772702025653592740778330593788799476134763712,
        728514340246547938323148150842723484958662012016,
        519290082616360949938148752793505475441002752559,
        723133633493102587412710472937948133597498575856,
        1064594489972968825305377979089126406275651298079,
        1105669943152283253809188893132668715196982163373,
        1363751346163822705338716284144513801543535110791,
        1057297862963634306346469733804130934824303341465,
        329515556736269120047004508929269543409035839509,
        707534049752829818810413527304084266658616754202,
        24288270301868464729682420275929446480331102786,
        782671616367791141347198864110968015447085454649,
        1254580574425156059392997420901602649329415091482,
        1296510118098249753084460724048516338336081050282,
        360571627435884760738632373190030414827040234533,
        1193425221860672995585627045122920131505237674141,
        348786223387419613557158061783235653279978947848,
        823666191489032333637271229518473814379136559039,
        711128794346109838057305189137235376064970826136,
        1370062945284145071679435202472879457653694193880,
        722456183315366327826272373833769146787730610278,
        617359116566433262570931811814803367549683886067,
        843830235568725219864882930311430450970601663237,
        20902789173392053554346178256678634898692112140,
        1201636521372336090888488633468602605854156932434,
        192989805897152073277086196053379203802028652254,
        819197352000746607897063819174399507135088334875,
        1254070248365975163268881700927356364512005819549,
        384485742925737075125558171189823184747260071086,
        52367179244203221219738608019365412864010027481,
        355749377817907287419711827423429250644463481353,
        556462634055986568951930230495067318823573975904,
        652573113028817052542488657684348382359884544171,
        1297524519052549338814385804924898853557210549673,
        1119477041597051138418307503938290828713707506878,
        72702646129902549080859047912684015619899878102,
        880477999432584191754007708087879409971034029809,
        470344519995489566393362986596849542039617088634,
        684367815563499819856823734114848372990903276818,
        243202486505099723505217908346744059990213806031,
        555158461664595942018039191221383691666789085975,
        11821397572682171073592171968267836059403285477,
        619894725331734721759533859158593593644862021185,
        262855523658555885607754663360657363558724961224,
        1072425736316177086559960552856261179995424533699,
        581270161438048957204998284798464679312993539517,
        897822880860424952726346927895244514718820459654,
        494307545242707451547796189203487595746355467677,
        1362369406220368591374616363651390231707015524461,
        414632574441094368895219437770710487412242005699,
        480391984031630003470886120991511843429033559267,
        981591297479551608148283560626656104501014183976,
        583810357920642441922979502163757550069375438807,
        328890686654810252803059723218673458123024427908,
        1289989029439735915845556245444697284021594326044,
        1035970154858362957604154189846632955281442804168,
        323862099416260717514677837171155202545986426739,
        328400785730367667700353867700436012248164215418,
        135979493245810259505341510765062807193460677870,
        627451456094834851497099056511096471948428859770,
        700502029106838281704343472764723785659333967360,
        334456027866086957698458106702961598594720783019,
        458222183623161850671638910941095636412077784501,
        1122137720889395761157893600901744324802698825148,
        1448764409069039053075809033686912216986000703620,
        792255386468970156876349310409036972519702788382,
        611622514578220212650015686510991357334332526321,
        454294461524589510165811621089261258920768019784,
        338962929308266778153157771712525964827399800101,
        748761032394372878784297012379906638073161690490,
        67628125700078984825365295529539097499567718163,
        1130572930870299079180028617397651346918457999528,
        36080049230420232748444406355506779098785421267,
        297066567052505225495646605125198281365448584715,
        1074733233798124869632086957466013346775458158729,
        1364192732241261257428316731256239569441832604629,
        553572555782828773582079845757316014562927917006,
        943677144889175241268947697461652480660135808659,
        1442133732367194601761291556072044665497375897957,
        885631862120018279012460204209072282711144267514,
        1214153597179838957778564081996949751351637853143,
        1156971759099790375749596762588431406564603700733,
        57961712361072929158851132227666858535966753634,
        1014329779829403275348224333384512404819084345901,
        1341664690376430445493358835494199379551678927701,
        605442995159995092435987140353799364620864655583,
        244963069037870328408775596183594382069195933547,
        1400155198527958333895054253805111597999975629367,
        624332706617608273153632596657422439473865601534,
        250919144290433127631168657728553838883440582737,
        634824650801749308336641619229378166697737796860,
        1104393496976264550357400420532446755641903530701,
        562712329257804497435794048438301848239136415934,
        782074013427887983360055140257980627808574391953,
        962700601453811244504860457783937155656563486920,
        1164662158087277506703451858867691608805608253506,
        935265576689394835412603753741471690588459521119,
        167995339264932845879715996451813459250169996292,
        1457426793976345543286858519555661542445206999549,
        495412880373689754890269927107806714589454807605,
        35551084423207969965136294758420222974320360446,
        265081110641874102231974635133317960851185639094,
        541529643057158500340012369575079949551707811165,
        47373574829345524358285805230537257424790876561,
        566131870544568345569835299882729231101558319779,
        1029466537649541674539162034986830724843815320725,
        427365786256311191924484728309890844547109563285,
        1226226420466297889665082427096593704282012124108,
        493566626241416811791461900365381280206488581453,
        680520796993477790639023445067952868375184548258,
        107319448305638554512601197083726162458187965398,
        1446100224265260954300104321471395398900386628445,
        1237608113258246846458822898650571580336723838781,
        1021482327712713685987289492874627808822335400968,
        1393323843220193697753702976061546584630768227320,
        1014413414982411627120026252713205467504785248817,
        913284896358370631207606541076467794279995623415,
        1279848522342588915039370726875009338435471000144,
        285179316197317608529554393165292906180537988899,
        137456060680944256102099804162791325640094818855,
        459587748134981387429216237606376184889621259070,
        1341627645769802971399130628674358421429505048682,
        263693299923159250970376076611522108796973595976,
        595448409134138005159968667003601742949411747614,
        1214022933768346447083260749895619486409350459877,
        418420131921148322781663281981292918187653509047,
        170986266479870242082981990102308241101272824496,
        664294101447237406297765887747124544839553733225,
        645638724081060418276140455560289946823823338694,
        225700651383829837113289180055919069685857718416,
        1274948884388164058800518139082374851303197491654,
        318544139260360034868538838966670017991820400918,
        493434433829387573243142398035312325738844543504,
        871562621546701190192746150765016511537421156902,
        1226144336800198064968872183011434243985881635637,
        933918616510628466904999025460544430068809059164,
        702347514591737542532453702017132423109845537884,
        1071273845827175552327342248791604080573046209535,
        1240817655838657777135854670018996744283012987140,
        875870204659290766842682491017828696152096574071,
        188093316895476935759161449048578340446272061868,
        1047368933218345554844031311793217887851890540215,
        318272618419464007910946656117605915607262707437,
        72348024748165956394988346572832307275179895132,
        696107273382489207132905531488953541031316047136,
        1153300963483156870549866289780302011025589910544,
        1213849092247398023832528007117429967152166744967,
        258731089257221728950612134332122567903177998599,
        1011094064269480402916938198977427236939615094114,
        395057475784029903970346736942716566679924813952,
        965304568859603254315481647975028967685575998547,
        1231260725384430048320357522266716443316707419375,
        1083476655088364771949473024534812164517340832950,
        219117598913375711779500502300211199073254282447,
        531781436976979080089627274084141126005951318884550194581019234109257825426,
        1984130212785264031690496591872617895170530808940282502615991056284599773675,
        624928039510714257128178481029069588172585192205434268492629304196634243142,
        2759109178751924651989509714451631067235754254158394695082619100422371625099,
        3616459225423243662539171717987414123046202991886322574915445418792219493783,
        250099987791792528719725414667427900089487397921101000923158573268468075600,
        1171977947792793907526898242047289872149964803492792810358548061030014390670,
        517940796285710800763503663124627034165719506616730903314697988135384762087,
        2978489716176670984999929826889034748132059545556091968874195299522479653503,
        3156901470139192515846232610466134547489304497987200744153272882088309247546,
        2271132343292181256363930817563559091272623111865558328139100299133447872037,
        2407603494502602086567737233993139100687851859455045058239611556483024198145,
        399946639682055340408654227351616438295685444024175637875412757126508623626,
        1239852395631881554222480630854261080352264710297721680011036013910922026362,
        3547396785177851334938120068496523245850817648583216503270948727685236008766,
        2291914496115720017778831031813270125598817515769022024603836296706663193056,
        1255651566965983475880702270607700495860973914832518677027627381741215471798,
        3162163812495127826880384877995715139171402263184442951467845605747727386880,
        1595510720607891065543083479453169604293414489813992941886580317431493476623,
        895648157989004382892671694585781073193150111911015114937061197222604883819,
        1690221331559299185495539482741039676594697421539958107668932286624822773560,
        171330745669863752368164172995966146372795881210659723206393907000336305782,
        2558634962282203112969743964216132555082308163009871618222973280267102103796,
        1854175805901945322816753803258506171085854477181413465333714860072134296452,
        2124983658823929096824064606711864064698711817311542448788186405078446042530,
        436568007905860808446023745844727311824794421693704653413316691028257762924,
        1790025259471642264118065531242296139945917841714368873412838204226147748176,
        3545450395333616493955819500282071940109389900146520397987942694625369946419,
        504572680146834543151760572155435772241191953237293646936403611588575344067,
        1453707733288359575113225984420369529431640589423469137665205461741215782019,
        1078442870290594540234064110441530217786343778702231032989504015825770502848,
        1762038109675393365384494673904143604736183814300514203509225129611803796841,
        3168343011425788357340908113385557674778513971005067669498918588637678048138,
        2800996729503490756008769747114586808778301049019558225168101664263801121317,
        1459128843780323772043992043417506140863339674679260953303495275076571081967,
        566425159096466240243194822864904174327967643619893905310523054847208824571,
        2485774431932381684984705469318832649861979267891693686077075736411281388345,
        2321332014555865517696908771400079038131685886977964532360949769016303733377,
        1202983991695884159509860739890480434476431248904228816889494280590746992095,
        3179534162109476342822054635774907146637020893465101234651958821782341008552,
        1554524506123275059219094199851800413779738441851310628268833464653437327266,
        1851375360642908260691827424401929317757606317916773610105833984603596857784,
        488612167967513385313989139180076046535526339112576789167163080246687213041,
        2664697130168323663000560790743737867624518566770128057504613939909582620632,
        440675098182478954229939270534923198966639529614537413200468710898911858275,
        1612429434502327404018012209215889219366444799607283044067236194357007723906,
        2193273363628533348290695232934416288392938919819363657667649966527822015016,
        1394754713887140095602355373328553645092278783149527895719471120429701764478,
        1075724842662989335468528908116802032030906667500613297221647595406068106876,
        1145720166361978830818985131684525612821849437881963152582648517987656170242,
        3011114029276924436505563433464520331248987625963149365139994455589348268051,
        1643293848324002295213462888260312636052214431402365640390341129728736785907,
    ].span()
}

#[test]
#[available_gas(9999999999)]
fn test_vector_commitment_decommit() {
    let witness_authentications = get_witness_authentications();
    let commitment = VectorCommitment {
        config: VectorCommitmentConfig { height: 20, n_verifier_friendly_commitment_layers: 9, },
        commitment_hash: 936159606372446880770773180413943646119933747687072192231671834696463400536
    };
    let witness = VectorCommitmentWitness { authentications: witness_authentications, };

    vector_commitment_decommit(commitment, get_queries(), witness);
}

// TODO: test failing vector decommit

// TODO: test vector_commit

// TODO: test validate_vector_commitment
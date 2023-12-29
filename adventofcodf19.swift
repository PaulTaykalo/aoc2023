import Foundation

// Set buffet to immediately flush output
setbuf(stdout, nil)

let inputTest = """
px{a<2006:qkq,m>2090:A,rfg}
pv{a>1716:R,A}
lnx{m>1548:A,A}
rfg{s<537:gd,x>2440:R,A}
qs{s>3448:A,lnx}
qkq{x<1416:A,crn}
crn{x>2662:A,R}
in{s<1351:px,qqz}
qqz{s>2770:qs,m<1801:hdj,R}
gd{a>3333:R,R}
hdj{m>838:A,pv}

{x=787,m=2655,a=1222,s=2876}
{x=1679,m=44,a=2067,s=496}
{x=2036,m=264,a=79,s=2244}
{x=2461,m=1339,a=466,s=291}
{x=2127,m=1623,a=2188,s=1013}
"""

//let input = loadFile("inputs/input19.txt")

let input3 = """
ft{m<1347:R,m<1967:A,A}
gbv{x<51:R,R}
lks{m<2978:kgl,a<680:ntb,x<577:hzp,mg}
db{a>2314:R,A}
rml{a<479:R,m>2803:A,R}
ncv{x<3567:R,a>3316:A,s>1415:R,R}
jsm{m>1434:brj,a>3142:vtk,x<2888:bpt,dl}
frt{s>210:R,a<1114:R,R}
zjq{m<195:A,R}
lv{m<1450:A,m<2105:xll,R}
kp{x>1194:A,x>1146:A,R}
nl{a>2317:A,A}
lrf{s<493:mpt,R}
cxf{x>2054:ktk,x<1860:qmg,lzk}
xb{s<1524:A,s>1602:A,R}
zz{x>3135:svb,x>2399:R,A}
ds{a>2495:R,x>924:R,pm}
zxf{m<2815:stp,a<2750:jpf,R}
fg{s>2319:A,A}
jb{a>3248:rm,s<3444:gdc,A}
trb{s<3836:A,x<1957:A,R}
nrk{x<995:bmc,R}
hk{m<968:btp,s<1545:nl,m>1092:npt,tlg}
ff{x<1733:R,s>2152:A,A}
msh{a>3446:R,A}
qt{m<1335:A,s<2757:tx,R}
ksm{a<3350:gr,R}
fsm{x>2098:R,a<360:R,R}
rff{m>312:R,A}
ddm{s<2671:R,trz}
bd{s<3121:A,R}
nr{s>2748:vmb,s<2491:xd,fbm}
fdn{a>659:cv,x>2325:xc,rt}
rcj{a<453:R,a<847:A,a>993:A,R}
brf{x<1485:A,R}
mzt{x>3019:A,m>306:R,A}
pc{x<2446:R,hc}
xf{a<3423:ln,x>1473:zjc,x>1440:R,cgx}
xn{s<3870:A,R}
qzn{m>1697:A,m>1501:A,R}
cdl{s<3605:A,s>3831:R,s<3743:dph,A}
mbq{x<3235:A,s<2567:A,s>2647:R,R}
sqt{x>2051:R,a>2036:A,s<1695:R,R}
tc{s<952:A,x>3099:R,m<3427:A,R}
kt{m<1388:jg,m>2013:mxm,xdr}
jxb{s>3521:R,x<851:A,x>1017:A,A}
qx{m>404:A,x<2423:R,a<2849:A,R}
ptj{m<3906:njh,R}
hd{s<566:R,m>1077:A,A}
bvh{s<1046:vd,x<2962:bz,m<1264:R,cqj}
zgs{m<388:A,x<1595:gqn,s<3635:R,khx}
pj{a<2319:R,a<2479:R,x<1521:llm,R}
kx{m>3616:kqd,x<1472:R,m>3298:kg,A}
mk{a<3610:R,m<2065:R,R}
jd{x<756:A,x>802:vcg,zgr}
qbq{x<1667:A,m>1173:R,x>1697:R,R}
cn{m>3371:nqj,m>3154:A,a>1170:R,sbx}
zrk{a<3201:A,m<1459:R,A}
qtz{m>517:nt,m>212:vpq,x<3049:pl,hb}
nhk{x>455:A,m<3081:A,s<3489:A,A}
rfd{m>1850:A,A}
nns{s<1799:A,A}
dm{s>95:A,R}
vz{m>3248:vb,nkr}
dcz{a>2149:km,R}
rrl{a<3198:ptk,s>3017:zgs,x>1554:hht,cht}
hs{m<673:A,R}
vf{s>1621:A,R}
qf{x>538:A,a<427:jc,lhf}
xbh{m>2071:jjb,s<582:xpc,a>3248:hpr,npd}
fz{m<1150:A,s<200:R,s<371:A,A}
gd{m>592:vt,a>1033:R,a>636:nlj,R}
znb{a<3808:A,x<3379:A,m<2068:A,A}
st{s<2677:R,a>1494:R,s>3382:A,R}
zf{m<3760:A,s<3288:A,R}
hh{s<2789:mz,jb}
tp{s<2498:R,A}
kz{a>2094:vqx,m>414:hzc,kzp}
xc{m>2388:nqp,a>432:A,x<3265:xch,A}
zgt{m<3336:A,s>2892:A,a>3062:R,A}
gtz{s>2688:tg,dp}
tf{m>3151:A,s<1440:A,R}
mxm{a<3193:A,x>816:R,a<3543:gqk,R}
fsp{a<3234:A,A}
tzf{s>2391:A,x>877:R,s>1154:A,R}
xgh{s>1188:mkk,a>2481:jm,kdc}
mjr{a>2688:zf,s>3239:gq,x<1313:R,fkc}
tvs{m<3240:gz,m<3630:clp,mjr}
zxp{a<2636:R,m<2968:R,a<2656:R,R}
kzp{a<2031:A,R}
rjl{s<592:frt,A}
vbz{a>2594:R,R}
klg{x>3362:A,s<1485:R,a>3704:R,A}
gr{m>1117:A,R}
nm{m>2633:R,A}
qkc{x>2875:R,R}
tsb{a<3865:A,x>2852:R,R}
lhm{s>3225:xs,a<2729:pj,m>3065:kx,xf}
blb{m<1562:A,R}
nsz{s<2211:jn,x<2387:nb,R}
tsj{x<3454:A,a<3740:R,x>3695:R,R}
bxk{x<487:A,m<3001:jzs,m>3535:R,zgt}
qq{a>2875:A,s<1314:A,m<982:A,R}
ksq{s<1649:R,x>2393:R,R}
hdz{x>3225:R,s>2321:A,R}
hp{m<1838:R,s<2302:A,x<588:R,A}
kf{a>748:A,A}
vb{m>3549:gvm,m>3403:R,A}
nx{s>486:R,A}
vtk{x<3172:tr,a>3353:nz,jr}
mlt{a>2987:A,s>286:A,A}
mv{s>2214:A,s<1986:A,s<2104:R,A}
fs{m<551:nll,hrj}
nh{s<3247:R,m>693:A,a>2956:A,R}
vpn{m<1447:R,gf}
bpd{a<3269:A,A}
mq{m<404:A,x>243:A,A}
jjx{x>3138:A,a>670:R,s>3088:R,A}
pn{s<1297:ds,m>1065:bj,bmf}
xp{x<1214:A,a<3436:R,m>866:R,A}
mpt{s>266:R,a>2276:A,A}
vk{m<1307:hd,tsj}
ql{a<1594:A,A}
bsb{m>2463:lks,x>626:tz,kk}
fn{a>1154:A,m<2652:R,s<1641:vtg,pzz}
knc{x<883:rfg,s<731:lv,s<1274:jkh,vdh}
kc{x<1160:jt,a>2721:qzg,m>1522:lrf,dg}
px{s<239:R,s>302:A,R}
bzf{m>3078:tln,s>575:gp,ml}
qfg{x>1167:R,x<1086:R,a>705:R,A}
ffn{a<1088:mbb,m<520:sb,vf}
jhg{m<3331:R,R}
llm{s>2346:R,a>2587:A,R}
xdr{s>3119:jxb,x>714:R,m<1724:zxl,hp}
cf{x<369:A,x<488:R,a<1340:A,A}
pvt{s>301:A,x<1488:A,a>3250:A,R}
dpm{x<3365:A,m>3696:A,R}
dhk{a>611:R,m>497:A,a<349:A,R}
dg{s>517:R,m<1250:fz,R}
ph{x<3427:R,a<2511:R,A}
hsx{x<1317:R,a<970:bzc,a<1412:cp,A}
mzb{m<2475:A,a<3151:R,s<101:A,A}
jtj{m<657:R,m<1047:R,s<1082:R,R}
xv{x>1004:A,s<1572:R,R}
cx{a<2527:A,A}
zn{m<2693:A,s>2559:R,m>3231:A,A}
nll{m<187:R,a>3715:A,R}
dh{x<1366:A,fq}
dr{a<3764:hf,a<3914:A,m<3290:A,R}
qz{s<257:R,fsp}
xfl{x>3188:A,x<2536:R,s<2342:A,A}
cz{m>3153:R,x<1136:R,x<1184:A,A}
qcf{s>2754:kmb,R}
fm{m<1085:R,a>2556:A,a>2420:R,R}
ld{s>737:A,s>489:R,a<88:A,R}
rfg{s<1129:ft,m>1514:mk,m>934:jpb,ggs}
lzh{m<1134:R,m<1308:R,A}
ckk{s>1464:lzh,s>1179:qq,R}
bvc{x>510:kt,m>1338:hh,pmm}
xtr{x>1686:A,R}
gxb{s<352:R,s<392:A,x>2751:A,R}
npd{a<3087:A,m>1379:vg,R}
hch{a>2219:R,A}
nj{m<2605:R,s<2930:R,R}
cvj{x<1520:R,qtm}
cgx{a<3678:R,s<2581:R,R}
tm{x>2596:A,A}
qtm{s>1379:A,a<2574:R,R}
ftt{s<2273:R,s>3405:A,m<609:R,A}
gqk{m<2274:R,a>3345:A,a<3279:A,R}
xqn{m<2098:R,a<1184:R,A}
qpm{x<2347:rff,x<2776:A,x>2977:A,ntz}
hvj{x<3486:R,A}
tpb{m<2448:lh,rjg}
shq{m>671:R,s>206:A,R}
htg{a>904:A,x>231:R,A}
jq{s<2890:dn,R}
gf{a<1251:A,A}
vl{m>913:ccb,a<1148:tb,s>2525:kbs,qtz}
xhl{s>399:R,a>2578:zxp,A}
ntz{m<273:A,R}
ntb{m<3543:qf,m<3783:lss,jj}
thm{a>1424:R,A}
km{m>3338:R,m>2932:A,x<3299:R,A}
fh{s>1157:xq,vk}
ljt{a>2529:R,m<1762:R,A}
hgv{s<1087:R,m<1627:A,x<1370:A,A}
brj{a>3113:gdz,a<2926:gkc,a<3040:zz,khd}
nz{x>3516:R,x<3380:A,A}
nvx{a>3182:R,x<3714:R,x>3816:A,R}
fx{a>3193:A,nhk}
spv{a>2824:vbl,m>2404:vtb,kqz}
zpn{s>2774:nj,m<2788:jmx,hvj}
cnx{s<1825:R,A}
jkl{a<2564:R,A}
lhf{s>1439:A,s<718:A,m<3252:A,A}
rm{x<225:A,A}
jxz{a<2321:A,a>2367:A,m>185:A,R}
hzq{a>651:R,x>2192:A,a>607:R,A}
jhv{a>3199:knc,s>776:pn,m>1007:kc,bx}
svj{a>3616:R,m>3421:R,m>2865:A,R}
vcg{s>2903:R,R}
vhm{m>1914:R,m<1754:R,x>1550:A,R}
ccb{s>1843:qt,bvh}
qr{x>2395:sv,A}
tlg{m<1031:A,x>2590:xfh,zp}
pt{s>435:A,a<2696:gg,s>170:mlt,xkz}
rj{x>1493:A,m<523:R,s>2867:A,R}
pr{a>2732:A,m<2650:A,A}
hzp{a>1120:kvf,m>3388:mf,hv}
btf{s<3748:xxc,A}
tr{m>717:R,A}
rv{a>672:R,R}
qg{s<2427:R,m<319:R,R}
lk{s<3170:A,A}
ksr{m>3137:gs,a<3314:hbg,s<1465:R,zk}
dbs{m>720:hk,a>2451:mvg,a<2212:kz,frl}
zdx{x<3645:R,s>849:A,A}
gvv{s>3441:R,A}
jlj{x>3003:cl,mcj}
vtb{s<2272:xgh,s>3350:ffz,vpj}
bdt{x<2027:px,x<2238:qh,R}
hbg{a<2847:R,A}
xd{x>2897:rd,a<3376:qr,nsz}
hb{m<77:R,a<1618:A,s>1205:nns,A}
lzj{m>2039:R,A}
ml{a>3118:R,s>304:R,zkv}
mt{s>2057:A,x>3358:npn,xzh}
htv{x>3422:A,a<1058:jjx,s>3318:R,mb}
lrm{x<2442:jxt,s>1388:hcm,R}
zjc{x>1530:A,a>3635:R,R}
kgl{x<688:fn,a<795:prh,dk}
pcz{m>3387:A,x<2362:A,A}
sf{a>690:A,mhf}
gqn{a<3554:A,A}
xfh{a>2277:A,s<2581:A,x<3067:R,A}
nlj{m<379:R,s<2220:A,R}
mcj{a>3825:ncb,x>2185:xjm,m>3112:R,R}
tln{s<565:pvt,a<3200:jlq,m>3598:lsx,A}
xns{m>2818:A,x>1648:R,m<2614:A,ht}
mx{s<940:R,s>1425:A,m>3518:tpn,A}
qgs{s>3234:rml,x>1876:pht,s<2763:R,tfv}
gt{s<3681:A,a<3251:R,R}
rcq{s>317:R,m<747:A,x>1403:R,R}
hzc{x<3241:A,s<1489:A,jbc}
fq{x>1398:A,s>2516:A,m>2301:R,R}
kvf{a<1562:cf,x>248:R,s>1776:qlm,A}
jfj{x<3469:A,a<2580:jz,s<2074:dbj,A}
vdh{s>1624:R,m>1500:rfd,zjn}
mg{s>1357:cn,rjl}
qnt{s<483:R,x>3442:R,A}
mp{s>3114:xqz,bq}
crp{a<3714:R,vj}
kq{m>3155:A,x>1456:R,R}
fhm{x>702:A,a<1104:rcj,zgp}
sl{x<1100:R,a<1423:A,A}
stp{s>2555:A,s>2383:A,s>2339:A,A}
pb{x<247:A,a>2834:fhp,a>2286:fm,R}
kbs{a>1536:zkr,xqb}
chf{s>2200:A,R}
bmc{x<968:A,x<982:A,A}
tjq{x<2908:btn,a<2595:dpm,mzg}
vfr{s>2143:pg,bsv}
bm{m<1791:R,m<1877:R,A}
kv{m>1866:jlj,m<870:fs,x<3127:vm,fh}
jpr{x<3038:R,a>3300:A,R}
gs{s>1177:R,R}
nhz{s>1928:R,s>1173:R,A}
hht{a<3615:msh,A}
mz{s>2285:R,s<2080:lzj,a>2672:gfp,gc}
kg{s>2590:R,R}
jr{a>3221:R,s<1664:nvx,ddv}
jpf{s<2652:A,a>2699:R,A}
cp{s>3057:A,x<1389:R,A}
tpn{m>3810:A,s<1214:A,x<2439:A,R}
vm{m>1226:tj,pc}
fr{m>557:A,a>3034:zjq,R}
gjj{m<3399:qzj,m<3784:cdl,a>2319:btf,ptj}
tjl{m<2439:A,m<3400:R,a<3075:A,R}
jkh{m<1257:jtj,qzn}
npt{s<2730:A,s>3447:R,a<2249:R,A}
xh{a<750:R,x<368:R,x>484:R,A}
sbx{s<2867:R,R}
zpj{s<1876:vpn,sf}
ln{a>3164:R,m<2847:R,m<2960:R,R}
cg{a<2409:R,s>3521:R,m>3415:R,A}
pg{x<2668:bjj,m>3516:htv,dvl}
lzk{m<3217:A,s>3712:trb,m>3591:qrz,A}
qkg{m<422:gx,x<3500:A,x<3738:zdx,R}
vkc{a>791:lnt,tzf}
ktk{s>3706:A,x>2390:R,cg}
dph{x>3090:R,a>2301:A,x<2908:R,R}
rq{x>327:R,x>164:A,R}
gl{s>487:A,a>1655:A,a<1331:R,A}
jmx{a<1052:A,s<2652:A,x>3318:R,A}
tk{s<3036:zpn,skp}
xkz{s<107:A,A}
ncb{s<760:R,s>1392:A,a>3927:R,A}
zv{s<859:R,A}
jzs{a<2665:A,s>2889:R,s>2655:A,A}
zbv{s<2370:npx,szq}
sxd{x<3268:R,a<3101:A,A}
kqd{s>2509:R,A}
fhp{m>943:R,s<3533:R,A}
jcg{a<2636:rgg,s>2865:xtr,a>3473:qbq,qtd}
fv{x>1586:sfh,s>1744:lhm,s<1005:bzf,ppd}
ppd{a>3253:prl,x<1484:zq,m>3222:cvj,mn}
zp{a<2416:A,m<1055:A,a<2598:A,A}
dl{s>1430:fr,ddt}
rvs{x<2743:jng,s<71:A,m>1651:mzb,dm}
lss{a>446:A,x>912:A,s>2317:tpj,dt}
cj{m<2996:A,m>3036:A,A}
vt{s>2338:R,a<1268:A,R}
zxl{x<637:A,R}
jng{m>2074:R,s<55:A,s<103:A,R}
gdc{s>3086:R,x>291:A,A}
jm{a<2685:xhl,rlq}
bst{m>1876:R,s>175:R,a>3154:A,A}
vtg{m>2801:A,s<673:A,m<2719:R,A}
gxs{a<2679:ljt,x>2149:A,s>2360:R,R}
tg{s>3232:gt,a>2631:xp,hfz}
xch{s<1053:R,s>1849:R,s<1395:R,R}
mvg{x<3100:qpm,s>2375:jkt,qkg}
cl{m>2802:cd,s<810:A,rfn}
ptk{s>2833:A,a>2436:sdx,s>2408:xfc,mv}
jj{x<576:A,R}
dvl{x>3429:A,a>954:R,a<621:lk,A}
jpb{m<1263:R,s>1379:A,x>568:A,A}
lsx{x>1481:R,m>3782:R,A}
nk{m>797:R,A}
qs{x<1815:A,a<208:ld,R}
jrr{x<2672:gxs,m<1958:hdz,jfj}
xs{s>3692:brf,x<1496:kq,mnl}
bh{a<1203:A,R}
gpm{m<414:A,x<3045:R,A}
xl{x>2732:kh,s<3328:jq,hzg}
lbr{s>2768:R,m>2649:mbq,jkl}
rpj{a<2149:A,x<2393:R,a<2171:A,A}
jbx{a>2843:bpd,s<571:cz,m<3351:cx,R}
gc{x>209:A,s<2192:A,R}
gp{m>2717:R,m>2542:xhq,A}
btp{m>880:A,x<2832:A,nk}
zx{a>374:R,m>2870:A,x<1136:R,A}
cqj{m<1430:A,x<3333:R,s<1454:A,R}
mzg{m<3447:A,m<3636:A,A}
pcg{a>746:mp,a<342:nsj,a<566:qgs,kck}
cjv{x>97:R,a>1081:ql,m<1933:gbv,nn}
lr{x>984:rcq,x<597:A,m<744:bpm,A}
mn{m<2758:R,R}
mbb{m>592:qfg,qg}
vqx{x<2718:rpj,m<417:fk,ftt}
zgr{m<1436:A,A}
gx{m>266:A,m<109:A,R}
zh{a>1474:A,x<1765:A,m>809:R,R}
rd{a<3284:sxd,a>3557:znb,s<2290:R,scc}
vpq{m<385:thm,s<850:gl,A}
sr{x>3148:R,s>2593:zrk,m>1611:zn,R}
btn{x>2233:A,s>2963:A,m<3546:R,R}
ddv{m<929:R,a<3189:R,R}
lj{s>720:hgv,s<311:A,m>1726:R,R}
dt{s>1007:A,m<3666:R,R}
jn{s>2145:A,A}
qtd{m<1205:A,a>3048:A,m<1281:R,A}
prl{m>3410:R,s<1367:hns,A}
mrg{x<2908:A,s<1375:R,x>3291:R,R}
pmm{s<3127:qlh,m>628:pb,xk}
sb{m>186:jbn,x>1199:R,s>1631:st,sl}
vj{x>3191:R,s<2638:A,A}
xq{x>3521:psx,klg}
trz{x>1532:R,R}
kck{m<2847:hzq,m>3005:R,m>2951:txt,dd}
jqg{x<1371:R,a<2887:R,A}
npn{x<3611:A,a>2239:R,a>2073:R,R}
xjm{s<752:R,a<3700:A,A}
bhj{s<2435:ndb,a>3069:nbp,x<1135:sjg,tvs}
mm{x<427:R,R}
vbb{s<129:rvs,x>2919:xg,x>2355:qz,bdt}
jlq{s<782:R,R}
gvm{s<2807:R,x>3086:A,a>2154:R,A}
vpj{a>2388:fbs,vz}
scc{s>2384:A,A}
bsv{a>993:tm,a>339:mx,x<2540:qs,nf}
fd{x>1200:rcv,x>1108:R,cnx}
tfv{s<2966:A,A}
qzj{s<3758:A,xn}
tz{x<939:ctb,m<1285:ffn,ch}
hv{a>827:A,s>1420:xh,R}
xpv{x<1644:R,R}
khd{x<2613:tjl,a<3080:A,A}
lz{a<2446:pz,jrr}
hfz{x<1227:R,x<1306:R,x>1351:A,A}
tj{x>2413:blb,A}
cd{a<3723:A,s>824:R,x>3620:A,A}
jkz{s<574:R,x<2957:R,s<839:A,A}
bpm{s<309:R,a<2751:R,R}
sjg{s>3133:dlk,qcf}
lnj{s>408:A,m<3185:A,s<382:R,A}
qlm{m>3399:A,m>3160:R,s<2770:A,R}
nqj{m>3601:A,s<2462:A,R}
qmk{a<218:A,m<2581:A,x<1964:R,A}
zkv{a<2439:A,a>2836:R,s>108:A,R}
dbj{a<2726:A,m>2173:A,A}
skp{a>1102:R,x<3363:ks,R}
pl{a>1567:lld,ss}
sdx{x>1582:A,a<2789:A,a>2991:R,R}
kpp{a<3749:R,a>3896:R,a>3815:R,A}
tjp{a>2329:R,R}
jsd{x<1697:R,a<2402:ff,m<3616:R,nhz}
rjg{x<955:zbv,x<1405:bhj,fv}
bpt{a>2950:lrm,m>712:ckk,kft}
rbf{s>3056:R,m>2843:A,A}
jqn{a>2437:A,x>2389:A,x<2155:R,R}
lld{a<1799:R,m>116:A,s>1201:A,R}
hm{x>1051:A,s>3482:A,x>1005:R,A}
bq{s<2735:R,a<1253:R,s>2952:A,A}
mc{m<103:A,s>2774:A,jxz}
mb{m>3733:A,a>1638:A,x<3043:R,A}
jkt{a<2628:ph,A}
xll{m>1829:A,x<1433:A,m<1592:A,R}
nnx{m<1438:gd,cjv}
nbp{x>1168:vx,x<1027:nrk,m<3404:xlh,jh}
jxt{a>3018:R,a>2989:R,x<2081:A,A}
qlh{s>2464:A,a>3258:fvc,R}
pkr{m>99:A,s<992:tjp,a>2330:R,R}
msc{m<1704:vl,m<3193:rbv,vfr}
ncx{x>3527:R,rv}
mnl{a<2870:R,s<3477:A,x>1527:A,A}
bzc{a>534:R,s>2369:R,R}
cv{m<2520:R,a>1382:A,R}
bjj{s<3237:sc,x>2020:R,A}
dxt{x>1973:R,x>1653:A,m<2147:R,A}
rbv{s<2474:fdn,m<2300:xl,x>2579:tk,pcg}
tb{x>3001:ncx,dhk}
hpr{s>740:R,A}
vg{m>1757:A,A}
zk{x>699:A,a>3640:A,A}
hns{x>1525:A,a<3550:R,a<3709:R,A}
in{a<1943:sg,x<1758:tpb,spv}
hpn{s<1880:jqn,A}
zjn{s<1412:R,A}
nhf{x<1660:A,x<1701:A,a>3374:A,R}
sc{x>1869:A,x<1591:R,R}
mkk{s<1676:tqm,x>2973:mt,hpn}
hz{a>2110:A,x>3216:R,a>2048:R,A}
ggs{s<1546:R,x>545:R,a>3613:A,R}
rgg{m>1130:A,R}
gdz{a<3255:A,a>3354:R,x<2961:ksq,ncv}
bmf{s>1655:R,a>2724:cgc,s>1420:xb,R}
khx{a>3552:R,x<1651:R,A}
qh{s>220:R,a<3157:R,R}
br{m<2805:pr,a>2750:cj,R}
jbc{a<2031:R,a<2059:A,m>600:R,R}
ddt{s>1226:A,A}
nqp{a<237:A,x<3128:A,s<1505:A,A}
nv{a<2139:rdn,s>247:gxb,m<2991:R,R}
pm{s<1106:A,A}
xhq{m>2657:R,s<856:R,A}
gkc{a<2864:A,s>1480:qkc,a>2894:R,R}
jh{x<1078:jls,A}
nf{a>157:R,R}
kft{a<2892:qx,m<461:R,R}
nkr{s<2913:A,x<2665:A,a<2197:R,R}
npx{x>520:ksr,ktf}
dn{x>2107:R,m<1969:A,a<693:A,A}
ss{a<1365:A,A}
kh{m>1995:xqn,A}
svb{m>2476:A,A}
gq{x>1247:A,x>1201:R,s<3631:A,R}
txt{s<3120:A,m>2972:R,R}
lh{s<1864:jhv,x<1112:bvc,lp}
prh{m>2745:zx,R}
sfh{a>3014:xkl,m>3147:jsd,xns}
xpc{x<2539:nx,m<990:qnt,a<3196:A,R}
ktf{a>3147:R,rq}
jls{a>3554:A,R}
bz{s>1380:R,A}
xlh{m>2973:A,a>3598:A,s<3449:R,vpb}
mf{s<2422:htg,A}
xxc{x<3193:A,s>3483:R,a>2650:A,A}
ks{x>3068:A,a>438:A,A}
kmb{a>2559:A,x>1045:A,R}
dlk{a<2513:hm,x>1045:jhg,A}
dj{s>354:xbh,vbb}
jc{m>3180:A,a>209:R,R}
pzz{m>2855:R,R}
fkc{s<2799:R,R}
rfn{x>3437:A,s<1636:A,R}
gz{x<1228:A,rbf}
rt{a<330:qmv,m>2632:A,x<2000:R,R}
clp{s<3277:R,s>3578:A,x<1236:R,A}
hrj{a>3673:tsb,s>1280:jbm,a>3584:A,R}
rcv{a<2713:A,m<3092:R,a>3295:A,R}
jg{x<847:A,nh}
rhz{m>1561:vhm,x<1609:ddm,m>1357:vnp,jcg}
gg{a<2326:R,m>232:R,R}
vbl{s>2050:nr,a>3485:kv,s>998:jsm,dj}
dk{m<2735:A,m<2834:A,R}
xzh{a<2518:A,a>2621:A,A}
jbn{a>1459:R,m>326:R,R}
szq{s<3344:bxk,s<3665:fx,a<3313:vbz,dr}
fbm{a>3537:crp,sr}
rlq{s>644:tc,R}
nrv{x>3604:A,s>180:R,m>3198:R,R}
lm{x<1301:A,x<1356:A,A}
ck{a>2781:R,s>2456:A,s>2295:R,A}
zq{x<1440:R,s<1354:A,m>3127:R,R}
pxq{x<1540:R,x<1654:R,A}
tpj{x<398:R,R}
qmg{x<1806:A,R}
qmv{s>915:A,A}
hc{s>1234:A,a<3777:A,s<543:A,R}
kdc{s<448:nv,x>2934:dcz,hch}
vmb{m>2094:gvv,s>3496:ksm,bd}
xqb{m<485:mzt,s>3300:A,hs}
hzg{a<746:fsm,m>1952:dxt,s>3756:bm,bh}
vnp{x<1675:xpv,A}
nb{x>1991:A,R}
xk{a<3000:mq,s<3447:vr,x<333:R,R}
ctb{x>831:vkc,s<1355:fhm,a<914:jd,tp}
xg{m<1340:shq,m<2708:R,s>261:A,nrv}
bj{a<2444:R,xv}
zkr{s<3365:R,A}
ndb{s>904:fd,x<1242:jbx,lm}
dd{a>665:R,R}
lnt{a<1177:A,x<901:A,x<919:R,R}
nn{m<2151:R,m>2257:A,R}
psx{x>3837:A,R}
zgp{m>1002:A,A}
rjt{s<1606:kf,R}
tqm{x<3109:pcz,tf}
xkl{m>3259:nhf,m<2733:nm,ltt}
fvc{s<2245:R,a>3610:R,a<3395:A,A}
vx{s>3405:A,s<2864:R,x<1291:svj,A}
fbs{m>3094:tjq,a<2671:lbr,s>2980:br,zxf}
sv{x<2686:A,A}
jt{s>307:mm,s>190:A,A}
ltt{m<2932:A,m>3097:R,R}
klj{a<190:R,R}
zj{a<3839:R,a<3898:R,a<3932:R,A}
qrz{a>2385:R,a<2103:A,a<2217:A,A}
dp{x>1276:fg,s>2212:ck,a>3255:kp,A}
qzg{a<2978:jqg,s>401:A,a<3083:pxq,bst}
fk{x<3153:R,R}
rdn{s<275:A,x>2619:A,s>365:A,R}
xdd{a>2338:xfl,db}
ht{s>1867:R,a<2561:R,a>2852:R,R}
ffz{x>2633:gjj,cxf}
xfc{a>2266:R,m>607:A,R}
gfp{m>1781:A,A}
ch{x<1246:rjt,m>2038:dh,s<1350:lj,hsx}
kqz{m>1171:lz,dbs}
njh{a>2157:A,m<3857:R,R}
nt{m<710:R,x>2315:mrg,s>1511:A,zh}
gv{a>2350:chf,m>516:A,gpm}
kk{x<285:nnx,zpj}
vpb{a<3293:R,a>3455:A,R}
pz{a>2276:xdd,fkl}
jbm{x<2951:A,s<1599:R,m<734:R,R}
tx{x>2805:R,R}
lp{x<1388:gtz,m>1008:rhz,rrl}
xqz{m>2687:A,s>3438:A,A}
hcm{s<1693:R,x<2623:A,R}
frl{m>274:gv,s<1923:pkr,mc}
fkl{x>2563:hz,a<2108:sqt,A}
nsj{m<2752:qmk,klj}
mhf{a>337:R,R}
cgc{s>1479:R,a>2929:R,R}
hf{a<3567:A,A}
jz{x<3661:R,R}
vr{x>269:A,x<163:A,s<3259:R,A}
jjb{a<3106:jkz,s>650:zv,s>457:jpr,lnj}
bx{m>437:lr,pt}
cht{a<3523:A,s>2630:rj,m>418:zj,kpp}
pht{x>2122:A,A}
vd{s>601:A,m>1408:A,A}
sg{x>1447:msc,bsb}

{x=238,m=232,a=127,s=30}
{x=489,m=234,a=187,s=941}
{x=2468,m=1586,a=611,s=1302}
{x=3030,m=825,a=221,s=748}
{x=1624,m=855,a=450,s=1328}
{x=2230,m=1545,a=397,s=179}
{x=115,m=98,a=233,s=353}
{x=1243,m=261,a=1160,s=301}
{x=1435,m=740,a=1442,s=16}
{x=2214,m=944,a=803,s=235}
{x=205,m=28,a=1261,s=591}
{x=1727,m=2967,a=1451,s=503}
{x=523,m=199,a=1088,s=1280}
{x=287,m=1673,a=558,s=2635}
{x=825,m=425,a=1999,s=1170}
{x=2442,m=1080,a=695,s=2139}
{x=450,m=2398,a=774,s=1790}
{x=460,m=1105,a=1617,s=2377}
{x=715,m=150,a=323,s=446}
{x=95,m=57,a=418,s=59}
{x=593,m=773,a=1205,s=1522}
{x=1305,m=365,a=2267,s=748}
{x=1882,m=698,a=649,s=1619}
{x=1438,m=58,a=366,s=317}
{x=105,m=457,a=351,s=409}
{x=2637,m=48,a=1364,s=120}
{x=546,m=1212,a=553,s=2020}
{x=289,m=1487,a=433,s=72}
{x=819,m=1468,a=1981,s=63}
{x=3224,m=304,a=2422,s=1500}
{x=1805,m=225,a=1755,s=138}
{x=1165,m=2002,a=337,s=1705}
{x=1140,m=2753,a=1535,s=491}
{x=1302,m=1637,a=228,s=1471}
{x=2472,m=293,a=1432,s=96}
{x=1950,m=298,a=573,s=492}
{x=92,m=869,a=1050,s=13}
{x=300,m=1946,a=539,s=8}
{x=2314,m=296,a=344,s=838}
{x=2344,m=261,a=809,s=3}
{x=355,m=1190,a=2970,s=74}
{x=1006,m=1092,a=825,s=2021}
{x=216,m=920,a=494,s=2965}
{x=392,m=816,a=863,s=175}
{x=2724,m=1041,a=1005,s=229}
{x=1371,m=269,a=627,s=1167}
{x=411,m=442,a=455,s=731}
{x=116,m=1840,a=2947,s=380}
{x=1958,m=383,a=960,s=897}
{x=379,m=1018,a=540,s=1312}
{x=180,m=1900,a=1999,s=437}
{x=1698,m=113,a=62,s=1213}
{x=6,m=295,a=24,s=2020}
{x=808,m=3042,a=920,s=1168}
{x=2905,m=93,a=2757,s=341}
{x=651,m=1805,a=435,s=3238}
{x=1763,m=384,a=1075,s=616}
{x=214,m=3035,a=536,s=844}
{x=775,m=43,a=353,s=413}
{x=1285,m=1315,a=429,s=1249}
{x=564,m=38,a=1534,s=268}
{x=665,m=1685,a=292,s=243}
{x=1047,m=875,a=2636,s=616}
{x=6,m=495,a=1926,s=2163}
{x=768,m=1896,a=458,s=22}
{x=163,m=741,a=451,s=796}
{x=106,m=794,a=1675,s=2563}
{x=824,m=2607,a=42,s=843}
{x=78,m=83,a=1718,s=2672}
{x=22,m=1108,a=197,s=307}
{x=160,m=190,a=3555,s=508}
{x=229,m=564,a=830,s=3129}
{x=594,m=1196,a=364,s=1703}
{x=2721,m=1009,a=872,s=3632}
{x=2893,m=564,a=282,s=536}
{x=1317,m=2746,a=427,s=602}
{x=1741,m=104,a=986,s=2976}
{x=637,m=1381,a=1037,s=255}
{x=1398,m=1991,a=682,s=1001}
{x=537,m=1433,a=148,s=773}
{x=143,m=2070,a=3859,s=358}
{x=2483,m=1234,a=779,s=361}
{x=277,m=462,a=585,s=1220}
{x=90,m=2449,a=2007,s=1234}
{x=192,m=1049,a=1542,s=1112}
{x=1907,m=13,a=105,s=3675}
{x=716,m=425,a=349,s=2780}
{x=841,m=2048,a=196,s=661}
{x=235,m=737,a=761,s=1338}
{x=337,m=29,a=2368,s=1528}
{x=346,m=2113,a=1210,s=31}
{x=325,m=1303,a=963,s=370}
{x=404,m=120,a=7,s=39}
{x=365,m=1286,a=846,s=8}
{x=985,m=338,a=724,s=731}
{x=132,m=127,a=257,s=349}
{x=752,m=5,a=1352,s=2079}
{x=923,m=513,a=861,s=1540}
{x=344,m=1492,a=432,s=2336}
{x=1598,m=13,a=848,s=1218}
{x=63,m=2897,a=825,s=781}
{x=928,m=786,a=315,s=1069}
{x=92,m=512,a=2113,s=1421}
{x=1624,m=763,a=1679,s=2171}
{x=207,m=668,a=85,s=1765}
{x=60,m=2722,a=69,s=3242}
{x=520,m=145,a=827,s=21}
{x=290,m=13,a=2511,s=1}
{x=736,m=831,a=1352,s=505}
{x=2405,m=272,a=1729,s=356}
{x=480,m=1087,a=298,s=178}
{x=764,m=56,a=637,s=484}
{x=2977,m=426,a=2928,s=261}
{x=2578,m=175,a=857,s=49}
{x=323,m=1228,a=1597,s=789}
{x=80,m=85,a=1637,s=1499}
{x=2443,m=1388,a=1084,s=105}
{x=152,m=1105,a=594,s=17}
{x=1,m=2959,a=1212,s=2164}
{x=93,m=570,a=2985,s=506}
{x=58,m=166,a=19,s=479}
{x=48,m=3218,a=534,s=927}
{x=2853,m=1521,a=628,s=38}
{x=963,m=285,a=460,s=2077}
{x=370,m=474,a=555,s=305}
{x=1440,m=8,a=751,s=856}
{x=1522,m=1839,a=3393,s=679}
{x=1501,m=850,a=117,s=1264}
{x=513,m=704,a=303,s=824}
{x=2778,m=769,a=786,s=2078}
{x=643,m=1653,a=1183,s=1101}
{x=599,m=34,a=81,s=1551}
{x=1927,m=1347,a=890,s=167}
{x=270,m=491,a=1367,s=2548}
{x=656,m=1953,a=1256,s=374}
{x=369,m=841,a=694,s=41}
{x=307,m=2036,a=5,s=210}
{x=588,m=148,a=422,s=622}
{x=1045,m=644,a=667,s=46}
{x=955,m=253,a=2044,s=1816}
{x=340,m=1166,a=70,s=1416}
{x=446,m=2736,a=185,s=1831}
{x=410,m=495,a=1996,s=1263}
{x=396,m=292,a=1697,s=178}
{x=104,m=976,a=2453,s=437}
{x=1018,m=1114,a=1377,s=89}
{x=1112,m=2070,a=611,s=389}
{x=965,m=239,a=2490,s=3543}
{x=629,m=494,a=1964,s=246}
{x=1509,m=292,a=2019,s=222}
{x=806,m=902,a=2764,s=757}
{x=452,m=2631,a=3531,s=61}
{x=976,m=959,a=247,s=771}
{x=1437,m=183,a=410,s=631}
{x=1984,m=792,a=1049,s=102}
{x=2670,m=583,a=146,s=2063}
{x=21,m=965,a=272,s=666}
{x=939,m=668,a=605,s=887}
{x=1956,m=1374,a=1251,s=1838}
{x=2159,m=1647,a=2537,s=1086}
{x=1366,m=1926,a=1117,s=385}
{x=426,m=387,a=1672,s=60}
{x=454,m=973,a=1007,s=1745}
{x=1230,m=1294,a=111,s=2851}
{x=947,m=1357,a=589,s=3}
{x=387,m=460,a=880,s=1002}
{x=409,m=886,a=1385,s=312}
{x=2082,m=219,a=3224,s=967}
{x=40,m=1073,a=2745,s=213}
{x=192,m=168,a=462,s=313}
{x=3387,m=782,a=937,s=272}
{x=2172,m=1671,a=890,s=1794}
{x=717,m=684,a=118,s=388}
{x=2392,m=26,a=108,s=1298}
{x=537,m=1924,a=241,s=2892}
{x=2531,m=1322,a=600,s=149}
{x=485,m=500,a=101,s=1}
{x=597,m=3017,a=397,s=1541}
{x=1234,m=172,a=225,s=383}
{x=337,m=3497,a=868,s=1029}
{x=1175,m=1917,a=226,s=3485}
{x=1627,m=2067,a=1210,s=2355}
{x=370,m=1609,a=3437,s=876}
{x=640,m=125,a=1038,s=216}
{x=327,m=6,a=189,s=29}
{x=3,m=1821,a=819,s=66}
{x=115,m=1831,a=662,s=970}
{x=2709,m=458,a=1189,s=1403}
{x=2202,m=731,a=858,s=913}
{x=209,m=94,a=2212,s=457}
{x=756,m=3382,a=1674,s=1311}
{x=624,m=738,a=233,s=137}
{x=1310,m=1252,a=314,s=2120}
{x=15,m=2772,a=182,s=84}
{x=549,m=785,a=69,s=923}
{x=1623,m=1888,a=457,s=24}
{x=619,m=828,a=336,s=762}
{x=573,m=101,a=217,s=2115}
{x=50,m=1103,a=230,s=1461}
{x=780,m=2290,a=339,s=3021}
"""

struct Part {
    let x: Int
    let m: Int
    let a: Int
    let s: Int
}
struct PartRange {
    let x: ClosedRange<Int>
    let m: ClosedRange<Int>
    let a: ClosedRange<Int>
    let s: ClosedRange<Int>
}

typealias Move = String
enum Condition: CustomStringConvertible {
    case xLessThan(Int, Move)
    case xGreaterThan(Int, Move)
    case mLessThan(Int, Move)
    case mGreaterThan(Int, Move)
    case aLessThan(Int, Move)
    case aGreaterThan(Int, Move)
    case sLessThan(Int, Move)
    case sGreaterThan(Int, Move)
    case move(String)

    var description: String {
        switch self {
        case .xLessThan(let value, let move):
            return "x < \(value) -> \(move)"
        case .xGreaterThan(let value, let move):
            return "x > \(value) -> \(move)"
        case .mLessThan(let value, let move):
            return "m < \(value) -> \(move)"
        case .mGreaterThan(let value, let move):
            return "m > \(value) -> \(move)"
        case .aLessThan(let value, let move):
            return "a < \(value) -> \(move)"
        case .aGreaterThan(let value, let move):
            return "a > \(value) -> \(move)"
        case .sLessThan(let value, let move):
            return "s < \(value) -> \(move)"
        case .sGreaterThan(let value, let move):
            return "s > \(value) -> \(move)"
        case .move(let move):
            return "move \(move)"
        }
    }
}

struct CheckNode: CustomStringConvertible {
    let name: String
    let conditions: [Condition]

    var description: String {
        return "\(name) -> \(conditions)"
    }
}

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

//var result = solve(input: inputTest)
// var result = solve(input: input)
 var result = solve(input: input3)
print("Result: \(result)")

/// ----------------------------------------------------------------------------------------------------

// MARK: - Solution ======================================================================================

/// ----------------------------------------------------------------------------------------------------

func solve(input: String) -> Int {
    print("Input: \(input)")
    
    var conditions = [CheckNode]()
    var parts = [Part]()
    var isConditionsParsing = true
    
    func parseConditions(line: Substring, conditions: inout [CheckNode]) {
        
        let name = String(line.split(separator: "{")[0])
        var conditionals = String(line.split(separator: "{")[1])
        conditionals.removeLast()
        
        var conditionArray = [Condition]()
        for conditional in conditionals.split(separator: ",") {
            
            if conditional.contains ("<") {
                let items = conditional.split(separator: "<")
                let valueAndsMove = items[1].split(separator: ":")
                let value = Int(valueAndsMove[0])!
                let moveString = String(valueAndsMove[1])
                let move = String(moveString)
                switch items[0] {
                case "x":
                    conditionArray.append(.xLessThan(value, move))
                case "m":
                    conditionArray.append(.mLessThan(value, move))
                case "a":
                    conditionArray.append(.aLessThan(value, move))
                case "s":
                    conditionArray.append(.sLessThan(value, move))
                default:
                    fatalError("Unknown conditional: \(conditional)")
                }
                continue
            }
            
            if conditional.contains (">") {
                let items = conditional.split(separator: ">")
                let valueAndsMove = items[1].split(separator: ":")
                let value = Int(valueAndsMove[0])!
                let moveString = String(valueAndsMove[1])
                let move = String(moveString)
                switch items[0] {
                case "x":
                    conditionArray.append(.xGreaterThan(value, move))
                case "m":
                    conditionArray.append(.mGreaterThan(value, move))
                case "a":
                    conditionArray.append(.aGreaterThan(value, move))
                case "s":
                    conditionArray.append(.sGreaterThan(value, move))
                default:
                    fatalError("Unknown conditional: \(conditional)")
                }
                continue
            }
            
            // Just move
            conditionArray.append(.move(String(conditional)))
        }
        
        conditions.append(CheckNode(name: name, conditions: conditionArray))
        
        
    }
    
    func parsePart(line: Substring, part: inout [Part]) {
        
        var s = line
        s.removeFirst()
        s.removeLast()
        
        let items = s.split(separator: ",")
        let x = Int(items[0].split(separator: "=")[1])!
        let m = Int(items[1].split(separator: "=")[1])!
        let a = Int(items[2].split(separator: "=")[1])!
        let ss = Int(items[3].split(separator: "=")[1])!
        part.append(Part(x: x, m: m, a: a, s: ss))
    }
    
    let condString = input.split(separator: "\n\n")[0]
    let partString = input.split(separator: "\n\n")[1]
    
    
    for line in condString.split(separator: "\n") {
        parseConditions(line: line, conditions: &conditions)
    }
    
    for line in partString.split(separator: "\n") {
        parsePart(line: line, part: &parts)
    }
    
    conditions.append(CheckNode(name: "R", conditions: []))
    conditions.append(CheckNode(name: "A", conditions: []))
    
    
    print("Conditions: \(conditions)")
    print("Parts: \(parts)")

    let partRanges =  [PartRange(x: 1...4000, m: 1...4000, a: 1...4000, s: 1...4000)]

    func solve(partRanges: [PartRange], currCond: CheckNode) -> Int {
        var sum = 0
        sum += partRanges.reduce(0) { $0 + solve(partRange: $1, currCond: currCond)}
        return sum
    }

    func solve(partRange: PartRange, currCond: CheckNode) -> Int {
        if currCond.name == "R" {
            return 0
        }
        if currCond.name == "A" {
            let x = partRange.x.count
            let m = partRange.m.count
            let a = partRange.a.count
            let s = partRange.s.count
            return x + m + a + s
        }

        var currPartRange = partRange

        var sum = 0

        for cond in currCond.conditions {
            switch cond {
            case .xLessThan(let value, let move):
                if partRange.x.lowerBound < value {
                    let nextRange = currPartRange
                    nextRange.x = nextRange.x.lowerBound...value - 1
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.x = value...currPartRange.x.upperBound
                }

            case .xGreaterThan(let value, let move):
                if partRange.x.upperBound > value {
                    let nextRange = currPartRange
                    nextRange.x = value + 1...nextRange.x.upperBound
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.x = currPartRange.x.lowerBound...value
                }

             case .mLessThan(let value, let move):
                if partRange.m.lowerBound < value {
                    let nextRange = currPartRange
                    nextRange.m = nextRange.m.lowerBound...value - 1
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.m = value...currPartRange.m.upperBound
                }

            case .mGreaterThan(let value, let move):
                if partRange.m.upperBound > value {
                    let nextRange = currPartRange
                    nextRange.m = value + 1...nextRange.m.upperBound
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.m = currPartRange.m.lowerBound...value
                }

            case .aLessThan(let value, let move):
                if partRange.a.lowerBound < value {
                    let nextRange = currPartRange
                    nextRange.a = nextRange.a.lowerBound...value - 1
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.a = value...currPartRange.a.upperBound
                }

            case .aGreaterThan(let value, let move):
                if partRange.a.upperBound > value {
                    let nextRange = currPartRange
                    nextRange.a = value + 1...nextRange.a.upperBound
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.a = currPartRange.a.lowerBound...value
                }

            case .sLessThan(let value, let move):
                if partRange.s.lowerBound < value {
                    let nextRange = currPartRange
                    nextRange.s = nextRange.s.lowerBound...value - 1
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.s = value...currPartRange.s.upperBound
                }

            case .sGreaterThan(let value, let move):
                if partRange.s.upperBound > value {
                    let nextRange = currPartRange
                    nextRange.s = value + 1...nextRange.s.upperBound
                    sum += solve(partRange: nextRange, currCond: conditions.filter { $0.name == move }[0])
                    
                    currPartRange.s = currPartRange.s.lowerBound...value
                }    




            case .move(let move):
                // Move next
                sum += solve(partRange: currPartRange, currCond: conditions.filter { $0.name == move }[0])
            }
        }
         return sum
    }

    
    
    var totalSum = 0
    for par in parts {
        print("Part: \(par)")
        var currCond = conditions.filter { $0.name == "in" }[0]
        
        while currCond.name != "R" && currCond.name != "A" {
            print("CurrCond: \(currCond)")

            var stopConditions = false
            for cond in currCond.conditions where !stopConditions {
                switch cond {
                case .xLessThan(let value, let move):
                    if par.x < value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .xGreaterThan(let value, let move):
                    if par.x > value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .mLessThan(let value, let move):
                    if par.m < value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .mGreaterThan(let value, let move):
                    if par.m > value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .aLessThan(let value, let move):
                    if par.a < value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .aGreaterThan(let value, let move):
                    if par.a > value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .sLessThan(let value, let move):
                    if par.s < value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .sGreaterThan(let value, let move):
                    if par.s > value {
                        currCond = conditions.filter { $0.name == move }[0]
                        stopConditions = true
                    }
                case .move(let move):
                    currCond = conditions.filter { $0.name == move }[0]
                    stopConditions = true
                }
            }
            
            print("Next: \(currCond)")

        }
        
        if currCond.name == "A" {
            totalSum += par.x + par.m + par.a + par.s
        }
        
    } // Parts
    
    
    
    var sum = 0
    
    print("Sum: \(totalSum)")
    return sum
}


/// ----------------------------------------------------------------------------------------------------

// MARK: - Private ======================================================================================

/// ----------------------------------------------------------------------------------------------------

func loadFile(_ filename: String) -> String {
    let fileURL = URL(fileURLWithPath: filename)
    let contents = try! String(contentsOf: fileURL)
    return contents
}

struct CM<Element> {
    var map: [[Element]]
    var width: Int { map[0].count }
    var height: Int { map.count }
    
    subscript(_ y: Int, _ x: Int) -> Element {
        get { map[y][x] }
        set { map[y][x] = newValue }
    }
    
    func printMap() {
        for row in map {
            print(row.map { "\($0)" }.joined(separator: ""))
        }
    }
}

extension CM where Element: Equatable {
    static func == (lhs: CM, rhs: CM) -> Bool {
        lhs.map == rhs.map
    }
}

extension CM where Element: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(map)
    }
}

extension CM where Element == Character {
    init(_ input: String) {
        self.map = input.split(separator: "\n").map { Array($0) }
    }
}

enum Direction: CustomStringConvertible {
    case up
    case down
    case left
    case right
    
    var description: String {
        switch self {
        case .up: "up"
        case .down: "down"
        case .left: "left"
        case .right: "right"
        }
    }
    
    func cw() -> Direction {
        switch self {
        case .up:.right
        case .down:.left
        case .left:.up
        case .right:.down
        }
    }
    
    func ccw() -> Direction {
        switch self {
        case .up: .left
        case .down: .right
        case .left: .down
        case .right: .up
        }
    }
}

struct Coord: Hashable, Equatable, CustomStringConvertible {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func top() -> Coord { Coord(x: x, y: y - 1) }
    func bottom() -> Coord { Coord(x: x, y: y + 1) }
    func left() -> Coord { Coord(x: x - 1, y: y) }
    func right() -> Coord { Coord(x: x + 1, y: y) }
    
    mutating func move(_ direction: Direction) {
        switch direction {
        case .up: y -= 1
        case .down: y += 1
        case .left: x -= 1
        case .right: x += 1
        }
    }
    
    var description: String {
        return "(\(x), \(y))"
    }
}

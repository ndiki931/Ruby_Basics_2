
#création de la page d'acceuil
def menu

	puts"Hello Dear ! WELCOME HAVE A SEAT AND ENJOY :) \n\n"
	puts"Voici ci-dessous la liste des discussions auxquelles je pourrais vous répondre à propos de votre array \n\n"
	puts"Les questions sont numérotées de 1 à 9 dans leur ordre \n\n"
	puts"1- Combien y a-t-il de journalistes dans ce array ?\n"
	puts"2- Combien d'handle contiennent un numéro ? \n"
	puts"3- Combien d'handle contiennent les 4 lettres du prénom Aude à la suite (sans prendre en compte les majuscules) ? \n"
	puts"4- Combien commencent par une majuscule (première lettre juste après le @) ? \n"
	puts"5- Combien contiennent au moins une majuscule ? \n"
	puts"6- Combien y a-t-il de underscore _ dans tous les pseudos confondus ? \n"
	puts"7- Trie la liste de handle par ordre alphabétique. \n"
	puts"8- Quels sont les 50 handles les plus courts de ce array ? \n"
	puts"9- Quelle est la position dans l'array de la personne @epenser ? \n\n\n"
end


#fonction permet de récupérer le numéro de question souhaité par l'utlisateur
def question_number
	puts"Maitenant veuillez choisir votre question sur la liste en tapant seulement le numéro de la question"
	print">"
	q_numb = gets.chomp.to_i
	#un saut de 2 lignes pour le visuel 
	puts("\n\n")

	#s'assuer que l'utlisateur tape bien les bonnes questions
	while (q_numb<1) || (q_numb>9)
		puts"OUps ce n'est pas un bon numéro !! veuillez entrer un bon numéro de questions"
		print">"
		q_numb = gets.chomp.to_i	
		#un saut de 2 lignes pour le visuel 
		puts ("\n\n")
	end

	return q_numb
end


#fonction permet d'afficher la question liée au numéro tapé par l'utisateur
def display_question(numero)
	puts"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

	#creation d'une table de hachage contenant toutes les questions avec comme clé les numéros de questions
	questions = Hash.new 
	questions["1"] = "Combien y a-t-il de journalistes dans ce array ?"
	questions["2"] = "Combien d'handle contiennent un numéro ?"
	questions["3"] = "Combien d'handle contiennent les 4 lettres du prénom Aude à la suite (sans prendre en compte les majuscules) ? "
	questions["4"] = "Combien commencent par une majuscule (première lettre juste après le @) ?"
	questions["5"] = "Combien contiennent au moins une majuscule ?"
	questions["6"] = "Combien y a-t-il de underscore _ dans tous les pseudos confondus ?"
	questions["7"] = "Trie la liste de handle par ordre alphabétique."
	questions["8"] = "Quels sont les 50 handles les plus courts de ce array ?"
	questions["9"] = "Quelle est la position dans l'array de la personne @epenser ?"

	#affichage de la question liée au numéro de questions entré par l'utlisateur
	puts questions["#{numero}"]
end


#traitement des informations pour répondre aux questions
def big_data(data, numero)

	#reponse a la premiere question
	if numero == 1
		puts"\n"
		puts"Il y'a #{data.length} journalistes dans votre array \n\n"
	end

	#reponse a la deuxieme question
	#la methode .grep permet de filtrer des objets énumérés comme les arrays ou ranges
	#la methode .count permet de compter le nombre de résultat que fournit lamethode .grep
	if numero == 2
		puts"Il y'a #{data.grep(/[0-9]/).count} emails qui contiennent un numéro"
		puts"\n"
		puts"Les voici :"
		puts"#{data.grep(/[0-9]/)} \n\n"
		
	end

	#reponse a la troisieme question
	if numero == 3
		downcase = data.map(&:downcase)
		aude = downcase.grep(/aude/).count
		puts"\n"
		puts "Il y a #{aude} emails qui contiennent les 4 lettres du prénom Aude"
		puts"\n"
		puts"Les voici :"
		puts"#{downcase.grep(/aude/)} \n\n"
	end

	#reponse a la quatrieme question
	if numero == 4
		puts"\n"
		puts "Il y a #{data.grep(/@[A-Z]/).count} emails qui commencent par une majuscule"
		puts"\n"
		puts"Les voici :"
		puts"#{data.grep(/@[A-Z]/)} \n\n"
	end

	#reponse a la cinquieme question
	if numero == 5
		puts"\n"
		puts "Il y a #{data.grep(/[A-Z]/).count} emails qui contiennent une majuscule"
		puts"\n"
		puts"Les voici :"
		puts"#{data.grep(/[A-Z]/)} \n\n"
	end

	#reponse a la sixieme question
	if numero == 6
		puts"\n"
		puts "Il y a #{data.to_s.count("_")} underscore dans tous les pseudos confondus"
		puts"\n"
	end

	#reponse a la septiéme question
	# tri de A>Z
	if numero == 7
		puts"\n"
		tri = data.sort(&:casecmp)
		puts"la liste est triée en ordre alphabétique comme indiquée ci-dessous"
		puts"\n"
		puts"#{tri}\n"
	end

	#reponse a la huitiéme question
	# les 50 handles les plus courst de votre array
	if numero == 8
		new_data = ["@jcunniet", "@PaulLampon"]
		k=0
		for i in (2..(data.length)-1)
			for j in (3..(data.length-1))
				if new_data[k+1] != new_data[k]
					if data[i] < data[j]
						new_data << data[i]
					end
				end
				k+= 1
			end
		end
		puts"\n"
		puts new_data
	end

	#reponse a la neuviéme question
	if numero == 9
		puts"\n"
		puts"la position dans l'array de la personne @epenser est :"
		puts"\n"
		puts"#{data.index("@epenser")}\n"
	end
		
		
end


	
def perform
	array = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@nbongarcon","@HeloAb","@Panamorama","@gregplou","@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures","@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3","@Julien_MARION","@SophiFay","@bdelombre","@annalecerf","@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus","@GPardigon","@e_vallerey","@IsabelleSouquet","@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire","@perraultvincent","@cboulate","@JustineWeyl","@Paulinejacot","@juliechab","@aslechevallier","@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon","@fannyguinochet","@EAssayag","@KibweAdom","@YvonHerry","@JohanGarciajg","@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy","@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF","@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa","@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi","@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel","@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau","@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet","@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal","@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca","@michelpicot","@Sev_Ryne","@bobdobolino","@murdever","@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette","@jankari","@delbello_rom","@rflechaux","@NadiaSorelli","@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal","@marionspee","@lisavignoli","@ChloeAeberhardt","@MartineJacot","@JuliaPascualita","@curieusedetout","@sgraveleau","@bif_o","@ElisaPineau","@zinebdryef","@apiquard","@pierrehaski","@StephanieDelmas","@Blandine_Garot","@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault","@alicedorgeval","@LouiseMalnoy","@alix_fx","@pierre_baudis","@LucMagoutier","@AgatheMuller","@SGianninelli","@PaulineBoyer33","@NaomiHalll","@romaindlx","@marionbr","@Burtschy","@JacobEtienne","@as_lizzani","@marie_simon","@LaureDaussy","@FabriceAmedeo","@LoubnaChlaikhy","@PlummerWilliam","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@Fatiha_Temmouri","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@KerinecMoran","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@LoriHelloc"]
	menu #appel de la fonction menu
	a =question_number #appel de la fonction question_number
	display_question(a)  #appel de la fonction display_question
	big_data(array,a) #appel de la fonction big_data
	
end
perform
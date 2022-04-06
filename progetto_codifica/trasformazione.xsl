<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:variable name="space"><![CDATA[&#32;]]></xsl:variable>

    <xsl:template match="/">
        <html>
            <head>
				<title>
					<xsl:value-of select="//tei:titleStmt/tei:title"/>
				</title>                
                <!-- riferimento ai file css e js -->
                <link rel="stylesheet" type="text/css" href="style.css"/>
				<link rel="stylesheet" href="magnify.css"/>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" charset="utf-8"></script>
				<script src="jquery.magnify.js" charset="utf-8"></script>
				<script src="script.js" charset="utf-8"></script>
            </head>
            <body>   
				<header>
					<ul>
                        <li><a href="#cartolina139">Cartolina 139</a></li>
						<li><a href="#cartolina159">Cartolina 159</a></li>
						<li><a href="#cartolina109">Cartolina 109</a></li>
                    </ul> 		
					<div id="title">
						<h1>
							<xsl:value-of select="//tei:titleStmt/tei:title"/>
						</h1>
                        <div class="introduzione">
                            <p><b>Il progetto:</b>
							<br/>
							Il sito è stato realizzato per il progetto del corso di Codifica di Testi a.a. 2021/2022 del corso di laurea in Informatica Umanistica e 
							consiste nella codifica di tre cartoline riguardanti la corrispondenza amorosa tra il militare <xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='G']/tei:persName/tei:forename"/> e 
							<xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='OT']/tei:persName"/>.<br/>
                            Le cartoline provengono dal <xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/>,
                            <xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/>,
                            <xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:country"/>.
                            <br/>
                            Le cartoline sono state pubblicate dall'<xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/>, 
                            nell'anno  <xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>, 
                            dal  <xsl:value-of
                            select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine"/>.
		                    <br/><br/>
							<b>Guida alla lettura delle cartoline:</b>
                    		<br/>
                        		- i caratteri tra [parentesi quadre] corrispondono a testo aggiunto dai trascrittori.
                        		<br/>
								- la dicitura "(poco chiaro)" rappresenta parole poco definite ma ancora leggibili e comprensibili. 
								<br/>
                        		- il simbolo "[...]" è stato inserito nel caso in cui del testo o una parte di esso sia stato considerato completamente illeggibile.
                        		<br/><br/>
                        		<i><b>Passando con il cursore sopra le immagini delle cartoline, una lente di ingrandimento permetterà di notare meglio i dettagli e le particolarità.</b></i>
							</p>							
                        </div>
                    </div>	
                </header>    
				<!--CARTOLINA 139-->
			    <div id="cartolina139">
			        <section class="divPrincipale">
						<div class="infoCart">
							<!-- identifico cartolina -->
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
							<!-- informazioni di una singola cartolina-->
							<div class="info1">
			                   <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader"/>
							</div>
							<!-- corrispondenza -->
							<div class="info2">
								<xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
								<!-- data corrispondenza -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]//tei:correspAction[1]/tei:date"/>
							</div>
						</div>
						<!--note-->
						<div class = "note">
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]//tei:note"/>
						</div>
                    
						<!-- fronte -->
			            <div class="fronte">
			                <h3>Fronte della cartolina</h3>
							<div id="fronte139">
								<!-- informazioni fronte -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[1]/tei:figure"/>
								<!-- autore opera-->
								<xsl:apply-templates select="//tei:person[@xml:id='B']/tei:persName"/>
                                <!--img fronte-->
								<xsl:element name="img">
									<xsl:attribute name="src">
										<xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:facsimile/tei:surface[@xml:id='c139F']/tei:graphic/@url"/>
									</xsl:attribute>
									<xsl:attribute name="class">zoom</xsl:attribute>
									<xsl:attribute name="data-magnify-src">
										<xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:facsimile/tei:surface[@xml:id='c139F']/tei:graphic/@url"/>
									</xsl:attribute>
								</xsl:element>
							</div>
						</div>
						<!-- retro-->
						<div class="box2">
							<h3>Retro della cartolina</h3>
							<!-- bottone per edizioni -->
							<button type="button" onclick="edizioni()" class="edizioni">Visualizza l'edizione interpretativa</button>
								<!-- messaggio -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]"/>	
								<!-- indirizzi -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:div/tei:p"/>
							<!-- stampe -->
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]"/>	
                            <!-- img retro -->
							<xsl:element name="img">
								<xsl:attribute name="src">
									<xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:facsimile/tei:surface[@xml:id='c139R']/tei:graphic/@url"/>
								</xsl:attribute>
								<xsl:attribute name="class">zoom</xsl:attribute>
								<xsl:attribute name="data-magnify-src">
									<xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:facsimile/tei:surface[@xml:id='c139R']/tei:graphic/@url"/>
								</xsl:attribute>										
							</xsl:element>							
						</div>
			        </section> 
			    </div> 
                <br/>
                <br/>  
                <hr/>
			   <!--CARTOLINA 159-->
			    <div id="cartolina159">
			        <section class="divPrincipale">
						<div class="infoCart">
							<!-- identifico cartolina -->
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
							<!--informazioni di una singola cartolina-->							
							<div class="info1">
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:teiHeader"/>
							</div>
							<!-- corrispondenza -->							
							<div class="info2">
								<xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
								<!-- data corrispondenza -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]//tei:correspAction[1]/tei:date"/>
							</div>
						</div>
						<!--note-->
						<div class = "note">
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]//tei:note"/>
						</div>

						<!-- fronte -->
			            <div class="fronte">
			                <h3>Fronte della cartolina</h3>
							<div class="fronte159">
								<!--informazioni fronte-->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[1]/tei:figure"/>
								<!-- autore opera-->
								<xsl:apply-templates select="//tei:person[@xml:id='CG']/tei:persName"/>
                                <!-- img fronte -->
								<xsl:element name="img">
									<xsl:attribute name="src">
										<xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:facsimile/tei:surface[@xml:id='c159F']/tei:graphic/@url"/>
									</xsl:attribute>
									<xsl:attribute name="class">zoom</xsl:attribute>
									<xsl:attribute name="data-magnify-src">
										<xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:facsimile/tei:surface[@xml:id='c159F']/tei:graphic/@url"/>
									</xsl:attribute>										 
								</xsl:element>
							</div>
						</div>
						<!-- retro-->
						<div class="box2">
							<h3>Retro della cartolina</h3>
							<!-- bottone per edizioni -->
							<button type="button" onclick="edizioni()" class="edizioni">Visualizza l'edizione interpretativa</button>							
                               	<!-- messaggio -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]"/>	
								<!-- indirizzi -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:div/tei:p"/>
							<!-- stampe -->
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]"/>		
							<!-- img retro -->
							<xsl:element name="img">
								<xsl:attribute name="src">
									<xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:facsimile/tei:surface[@xml:id='c159R']/tei:graphic/@url"/>
								</xsl:attribute>
								<xsl:attribute name="class">zoom</xsl:attribute>
								<xsl:attribute name="data-magnify-src">
									<xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:facsimile/tei:surface[@xml:id='c159R']/tei:graphic/@url"/>
								</xsl:attribute>									
							</xsl:element>		
						</div>
			        </section> 
			    </div>
                <br/>
                <br/> 
                <hr/>
			   <!--CARTOLINA 109-->
			    <div id="cartolina109">
			        <section class="divPrincipale">
						<div class="infoCart">
							<!-- identifico cartolina -->
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
							<!--informazioni di una singola cartolina-->							
							<div class="info1">
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:teiHeader"/>
							</div>
							<!-- corrispondenza -->							
							<div class="info2">
								<xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
								<!-- data corrispondenza -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]//tei:correspAction[1]/tei:date"/>
							</div>
						</div>
						<!--note-->						
						<div class = "note">
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]//tei:note"/>
						</div>

						<!-- fronte -->
			            <div class="fronte">
			                <h3>Fronte della cartolina</h3>
							<div class="fronte109">
								<!--informazioni fronte-->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:text/tei:body/tei:div[1]/tei:figure"/>
								<!-- autore opera-->
								<xsl:apply-templates select="//tei:person[@xml:id='M']/tei:persName"/>
								<!-- stampa fronte-->
								<div class = "stampa_fronte">
									<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:text/tei:body/tei:div[1]/tei:figure/tei:stamp"/>	
								</div>							
                                <!-- img fronte -->
								<xsl:element name="img">
									<xsl:attribute name="src">
										<xsl:value-of select="tei:teiCorpus/tei:TEI[3]/tei:facsimile/tei:surface[@xml:id='c109F']/tei:graphic/@url"/>
									</xsl:attribute>
									<xsl:attribute name="class">zoom</xsl:attribute>
									<xsl:attribute name="data-magnify-src">
										<xsl:value-of select="tei:teiCorpus/tei:TEI[3]/tei:facsimile/tei:surface[@xml:id='c109F']/tei:graphic/@url"/>
									</xsl:attribute>									 
								</xsl:element>
							</div>
						</div>
						<!-- retro-->
						<div class="box2">
							<h3>Retro della cartolina</h3>
							<!-- bottone per edizioni -->
							<button type="button" onclick="edizioni()" class="edizioni">Visualizza l'edizione interpretativa</button>
                               	<!-- messaggio -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:text/tei:body/tei:div[2]/tei:div[1]"/>	
								<!-- indirizzi -->
								<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:div/tei:p"/>						
							<!-- stampe -->
							<xsl:apply-templates select="tei:teiCorpus/tei:TEI[3]/tei:text/tei:body/tei:div[2]"/>		
							<!-- img retro -->
							<xsl:element name="img">
								<xsl:attribute name="src">
									<xsl:value-of select="tei:teiCorpus/tei:TEI[3]/tei:facsimile/tei:surface[@xml:id='c109R']/tei:graphic/@url"/>
								</xsl:attribute>
								<xsl:attribute name="class">zoom</xsl:attribute>
								<xsl:attribute name="data-magnify-src">
									<xsl:value-of select="tei:teiCorpus/tei:TEI[3]/tei:facsimile/tei:surface[@xml:id='c109R']/tei:graphic/@url"/>
								</xsl:attribute>									
							</xsl:element>
						</div>
			        </section> 
			    </div>
                <br/>
                <br/> 
                <hr/>
                <!--crediti-->
                <div id="crediti">
                	<xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc"/>
               	</div>	
            </body>
        </html>
    </xsl:template>

	 <!--template titolo della cartolina -->
	<xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
    	<h2><xsl:value-of select="."/></h2>
    </xsl:template>   

	<!--template informazioni singola cartolina-->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader">
    	<p><b>Identificatore cartolina: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/></p>
    	<p><b>Descrizione: </b><xsl:value-of select="tei:profileDesc/tei:textClass/tei:keywords/tei:term[2]"/></p>
        <xsl:value-of select="$space" disable-output-escaping="yes"/>
        <p><b>Caratteristiche: </b><xsl:value-of select="//tei:height"/>x<xsl:value-of select="//tei:width"/>cm, <xsl:value-of select="//tei:material"/>, <xsl:value-of select="//tei:condition"/></p>
    	<p><b>Lingua: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:textLang"/></p>
    </xsl:template>

	<!--template informazioni corrispondenza-->
	<xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc">
		<p><b>Mittente: </b><xsl:value-of select="tei:listPerson/tei:person[@xml:id='G']/tei:persName/tei:forename"/> (firmato <xsl:value-of select="tei:listPerson/tei:person[@xml:id='G']/tei:persName/tei:addName"/>)</p>
		<p><b>Destinatario: </b><xsl:value-of select="tei:listPerson/tei:person[@xml:id='OT']/tei:persName"/></p>
		<p><b>Provenienza: </b><xsl:value-of select="tei:listPlace/tei:place[@xml:id='MO']/tei:placeName"/> (<xsl:value-of select="tei:listPlace/tei:place[@xml:id='MO']/tei:district[2]"/>)</p>
		<p><b>Destinazione: </b><xsl:value-of select="tei:listPlace/tei:place[@xml:id='RV']/tei:placeName"/> (<xsl:value-of select="tei:listPlace/tei:place[@xml:id='RV']/tei:district[2]"/>)</p>
	</xsl:template> 

	<!-- data corrispondenza-->
	<xsl:template match="tei:teiCorpus/tei:TEI//tei:correspAction[1]/tei:date">
		 <p><b>Data: </b><xsl:value-of select="."/></p>
	</xsl:template>

	<!-- note-->
	<xsl:template match="tei:teiCorpus/tei:TEI//tei:note">
		 <p><b>Note: </b><xsl:value-of select="."/></p>
	</xsl:template>

    <!--template informazioni fronte cartoline -->
     <xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div[1]/tei:figure">
        <p><b>Titolo opera: </b><xsl:value-of select="tei:head"/></p>
        <p><b>Descrizione: </b><xsl:value-of select="tei:figDesc"/></p>
    </xsl:template>

    <!--template autore Bonora-->
	<xsl:template match="//tei:person[@xml:id='B']/tei:persName">
		<p><b>Autore dell'opera: </b><xsl:value-of select="."/></p>
	</xsl:template>

	<!--template autore Giris-->
	<xsl:template match="//tei:person[@xml:id='CG']/tei:persName">
		<p><b>Autore dell'opera: </b><xsl:value-of select="."/></p>
	</xsl:template>

	<!--template autore Muzioli-->
	<xsl:template match="//tei:person[@xml:id='M']/tei:persName">
		<p><b>Autore dell'opera: </b><xsl:value-of select="."/></p>
	</xsl:template>

	<!--template messaggio -->
	<xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div[2]/tei:div[1]">
		<div class="messaggio">
			<!-- opener -->
			<p><b>Messaggio: </b><br/><br/><xsl:value-of select="tei:opener"/></p>
			<!-- closer -->
			<p><xsl:value-of select="tei:closer/tei:salute"/></p>
			<!-- firma -->
			<p><xsl:value-of select="//tei:signed"/></p>
			<br/>
		</div>
	</xsl:template>

	<!-- template indirizzi -->
	<xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:div/tei:p">
	<div class="indirizzo">
			<p><b>Indirizzo: </b></p>
			<!-- gentile signorina-->
			<p class="diplomatica"><xsl:apply-templates select="tei:address/tei:addrLine[1]/tei:abbr"/></p>
			<p class="interpretativa" style="display:none"> <xsl:apply-templates select="tei:address/tei:addrLine[1]/tei:expan"/></p>
			<!-- Oliva Turtura -->
			<p><xsl:value-of select="tei:address/tei:addrLine[2]"/></p>
			<!-- indirizzo -->
			<span class="via">
				<p><xsl:value-of select="tei:address/tei:addrLine[3]/tei:seg[1]"/></p>
				<p class="diplomatica spacenone"><xsl:value-of select="tei:address/tei:addrLine[3]/tei:c"/></p>
				<p class="interpretativa spacenone" style="display:none"><xsl:value-of select="tei:address/tei:addrLine[3]/tei:seg[2]"/></p>
				<p><xsl:value-of select="tei:address/tei:addrLine[3]/tei:seg[3]"/></p>
			</span>
			<!-- Ravenna-->
			<p><xsl:apply-templates select="tei:address/tei:addrLine[4]"/></p>
			<br/>
		</div>
	</xsl:template>

	<!-- template francobolli, timbri e stampe -->
	<xsl:template match="tei:teiCorpus/tei:TEI/tei:text/tei:body/tei:div[2]">
		<div class="stampe">
		<h3><b>Timbri, francobolli e stampe:</b></h3>
			<!--template numero identificativo-->
			<b>Numero identificativo:</b>
				<xsl:value-of select="tei:p/tei:idno"/><br/><br/>
			<!-- timbri -->
            <b>Timbri:</b>
        	<xsl:for-each select="tei:div[2]/tei:p/tei:stamp">
                	<xsl:if test="@type='postmark'">
                   		<xsl:apply-templates select="."/> 
                    	<br/><br/>
                	</xsl:if>
        	</xsl:for-each>
			<!-- francobollo-->
			<b>Francobollo: </b>
			    <xsl:value-of select="tei:div[2]/tei:p/tei:stamp[2]"/><br/>
			<br/>
			<!-- stampe--><b>Stampe:</b>
			<xsl:apply-templates select="tei:div[3]/tei:p[1]/tei:stamp"/><br/><br/>
			<xsl:apply-templates select="tei:div[3]/tei:p[2]/tei:stamp"/><br/><br/>
            <xsl:apply-templates select="tei:div[4]/tei:p[1]/tei:stamp"/><br/><br/>
			<xsl:apply-templates select="tei:div[4]/tei:p[2]/tei:stamp"/><br/><br/>
		</div>
	</xsl:template> 
	
	<!-- crediti-->
	<xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
	    <h2>Crediti</h2>
		<div class="crediti1">
			<!--Trascrittore-->
			<p>
				<b>
					<xsl:value-of select="tei:titleStmt/tei:respStmt[1]/tei:resp"/>			
				</b>
				<xsl:value-of select="$space" disable-output-escaping="yes"/>
				<xsl:value-of select="tei:titleStmt/tei:respStmt[1]/tei:name[1]"/>, 
				<xsl:value-of select="tei:titleStmt/tei:respStmt[1]/tei:name[2]"/>
			</p>
			<!--Codificatore-->
			<p>
				<b>
					<xsl:value-of select="tei:editionStmt/tei:respStmt[1]/tei:resp"/>
				</b>
				<xsl:value-of select="$space" disable-output-escaping="yes"/> 
				<xsl:value-of select="tei:titleStmt/tei:respStmt[1]/tei:name[1]"/>, 
				<xsl:value-of select="tei:titleStmt/tei:respStmt[1]/tei:name[2]"/>
			</p>
			<!--Compilatore-->
			<p>
				<b>
					<xsl:value-of select="tei:editionStmt/tei:respStmt[2]/tei:resp"/>
				</b>
				<xsl:value-of select="$space" disable-output-escaping="yes"/>      
				<xsl:value-of select="tei:editionStmt/tei:respStmt[2]/tei:name"/>
			</p>
		</div>
		<div class="crediti2">
			<!--Responsabile scientifico -->
			<p>
				<b>
					<xsl:value-of select="tei:editionStmt/tei:respStmt[3]/tei:resp"/>
				</b>
				<xsl:value-of select="$space" disable-output-escaping="yes"/>
				<xsl:value-of select="tei:editionStmt/tei:respStmt[3]/tei:name[1]"/> , 
				<xsl:value-of select="tei:editionStmt/tei:respStmt[3]/tei:name[2]"/>
			</p>
			<!--Funzionario responsabile-->
			<p>
				<b>
					<xsl:value-of select="tei:editionStmt/tei:respStmt[4]/tei:resp"/>
				</b>
				<xsl:value-of select="$space" disable-output-escaping="yes"/>
				<xsl:value-of select="tei:editionStmt/tei:respStmt[4]/tei:name"/>
			</p> 
            <p>
			<b><xsl:value-of select="//tei:availability"/> </b> concessa dal   
            <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine"/>.
		</p>  
		</div> 
    </xsl:template>

	<!--template edizione interpretativa-->
	<xsl:template match="tei:expan">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<!--template edizione diplomatica-->
	<xsl:template match="tei:abbr">
		<xsl:value-of select="."/>
	</xsl:template>

	<!--template unclear e gap-->
    <xsl:template match="tei:unclear">
     <xsl:value-of select="."/>(poco chiaro)
	</xsl:template>

    <xsl:template match="tei:gap">[...]</xsl:template>
	
	<!--template sottolineature-->
    <xsl:template match="tei:hi">
        <xsl:if test="@rend='underline'">
            <u><xsl:apply-templates/></u>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>   


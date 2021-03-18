u27 = ffgen(('x^3-'x+1)*Mod(1,3),'u);

codf27(s) = [if(x==32,0,u27^(x-97))|x<-Vec(Vecsmall(s)),x==32||x>=97&&x<=122];

ascii2str(v)=Strchr(v);

decode(v) = {
  ascii2str([ c+97 | c <- v]);
}

\\if(c==0,32,c+97)

\\for(i=1, 27, print(u27^i););
\\a=u27^5;
\\b=u27^5;
\\if(a==b, print("oui"), print("non"));

logd(a) = {
	i=0;
	g=1;
	r=0;
	for(i=0, 26, g=u27^i; if(g==a, r=i););
	if(r==26, r=0);
	return(r);
}

delogd(v) = {
	[ logd(c) | c <- v];
}

P='x^40+'x+u27;

M=matcompanion(P)~;

\\print(M);

B=M^32;
C=B^7;
D=C^47;
E=D^71;
F=E^239;
G=F^5203391;
Inverse=G^(-1);

\\print(Id);
\\print(G);
\\print(Inverse);

\\(2^5 * 7 * 47 * 71 * 239 * 5203391)


\\k=logd(u27^6);
\\print(k);


inputvector=readvec("input.txt")[1];
chiffre=inputvector[2];
messagechiffre=codf27(chiffre);

produit=Inverse*(messagechiffre~);

messagedechiffre=produit~;

messagedechiffreavecdesnombres=delogd(messagedechiffre);

\\print(messagechiffre);
\\print(produit);

\\print(messagedechiffreavecdesnombres);

entouteslettres=decode(messagedechiffreavecdesnombres);

print(entouteslettres);



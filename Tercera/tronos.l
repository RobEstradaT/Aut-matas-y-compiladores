%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <ctype.h>

	    int contWesteros = 0;
	    int contInvernalia = 0;
	    int contDesembarco = 0;
	    int contNido = 0;
	    int contAltojardin = 0;
	    int contAguasdulces = 0;
	    int contRocadragon = 0;
	    int contCasterly = 0;
	    int contTormentas = 0;
	    int contDorne = 0;

	    int contStark = 0;
	    int contArryn = 0;
	    int contTully = 0;
	    int contGreyjoy = 0;
	    int contLannister = 0;
	    int contTyrell = 0;
	    int contMartell = 0;
	    int contBaratheon = 0;
	    int contTargaryen = 0;

	    int contEddard = 0;
	    int contCatelyn = 0;
	    int contArya = 0;
	    int contSansa = 0;

	    int contRobert = 0;
	    int contJoffrey = 0;
	    int contStannis = 0;

	    int contAegon = 0;
	    int contDaenerys = 0;
	    int contAerys = 0;

	    int contTywin = 0;
	    int contJaime = 0;
	    int contTyrion = 0;
	    int contCersei = 0;



%}

%%
Westeros                   { contWesteros++; }
Invernalia                 { contInvernalia++; }
[Dd]esembarco[ ]del[ ]Rey  { contDesembarco++; }
[Nn]ido[ ]+de[ ]+[A\xC1a]guilas   { contNido++; }

[Aa]ltojardin|[Aa]ltojard[ií]n { contAltojardin++; }
[Aa]guasdulces             { contAguasdulces++; }
[Rr]ocadrag[oó]n           { contRocadragon++; }
[Rr]oca[ ][Cc]asterly      { contCasterly++; }
[Bb]ast[ií]on[ ]de[ ][Tt]ormentas { contTormentas++; }
[Dd]orne                   { contDorne++; }

[Ss]tark        { contStark++; }
[Aa]rryn        { contArryn++; }
[Tt]ully        { contTully++; }
[Gg]reyjoy      { contGreyjoy++; }
[Ll]annister    { contLannister++; }
[Tt]yrell       { contTyrell++; }
[Mm]artell      { contMartell++; }
[Bb]aratheon    { contBaratheon++; }
[Tt]argaryen    { contTargaryen++; }

[Ee]ddard       { contEddard++; }
[Cc]atelyn      { contCatelyn++; }
[Aa]rya         { contArya++; }
[Ss]ansa        { contSansa++; }

[Rr]obert       { contRobert++; }
[Jj]offrey      { contJoffrey++; }
[Ss]tannis      { contStannis++; }

[Aa]egon        { contAegon++; }
[Dd]aenerys     { contDaenerys++; }
[Aa]erys        { contAerys++; }

[Tt]ywin        { contTywin++; }
[Jj]aime        { contJaime++; }
[Tt]yrion       { contTyrion++; }
[Cc]ersei       { contCersei++; }



. {}


%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }
    
    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        perror("Error al abrir el archivo");
        return 1;
    }
    
    yyin = archivo;
    yylex();
    fclose(archivo);

    printf("\n--- Regiones ---\n");
    printf("- Westeros: %d veces\n", contWesteros);
    printf("- Invernalia: %d veces\n", contInvernalia);
    printf("- Desembarco del Rey: %d veces\n", contDesembarco);
    printf("- Nido de Aguilas: %d veces\n", contNido);
    printf("- Altojardin: %d veces\n", contAltojardin);
    printf("- Aguasdulces: %d veces\n", contAguasdulces);
    printf("- Rocadragon: %d veces\n", contRocadragon);
    printf("- Roca Casterly: %d veces\n", contCasterly);
    printf("- Bastion de Tormentas: %d veces\n", contTormentas);
    printf("- Dorne: %d veces\n", contDorne);

    printf("\n--- Casas Nobles ---\n");
    printf("- Stark: %d veces\n", contStark);
    printf("- Arryn: %d veces\n", contArryn);
    printf("- Tully: %d veces\n", contTully);
    printf("- Greyjoy: %d veces\n", contGreyjoy);
    printf("- Lannister: %d veces\n", contLannister);
    printf("- Tyrell: %d veces\n", contTyrell);
    printf("- Martell: %d veces\n", contMartell);
    printf("- Baratheon: %d veces\n", contBaratheon);
    printf("- Targaryen: %d veces\n", contTargaryen);

    printf("\n--- Personajes ---\n");
    printf("- Eddard: %d veces\n", contEddard);
    printf("- Catelyn: %d veces\n", contCatelyn);
    printf("- Arya: %d veces\n", contArya);
    printf("- Sansa: %d veces\n", contSansa);
    printf("- Robert: %d veces\n", contRobert);
    printf("- Joffrey: %d veces\n", contJoffrey);
    printf("- Stannis: %d veces\n", contStannis);
    printf("- Aegon: %d veces\n", contAegon);
    printf("- Daenerys: %d veces\n", contDaenerys);
    printf("- Aerys: %d veces\n", contAerys);
    printf("- Tywin: %d veces\n", contTywin);
    printf("- Jaime: %d veces\n", contJaime);
    printf("- Tyrion: %d veces\n", contTyrion);
    printf("- Cersei: %d veces\n", contCersei);

    return 0;
}

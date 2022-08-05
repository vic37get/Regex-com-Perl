#!/usr/bin/perl

use strict;
my $linha;
my $string = '';

#Lendo o arquivo
open(texto, "poesias_machado_de_assis.txt");
while ($linha = <texto>){
    $string = $string.$linha;
}

#Poesias
my @poesias = ($string =~ /\r\n\r\n.+\r\n\r\n\r\n|([A-Z ]+\r\n)/gm);
my $count_poesias = @poesias;
print("Poesias: $count_poesias\n");

#Versos
my @versos = ($string =~ /.+\r\n(?!\r\n\r\n[^\r])/gm);
my @versos2 = ($string =~ /((?!(.+\r\n){2,})O.+)/gs);
push @versos, $versos2[0];
my $count_versos = @versos;
print("Versos: $count_versos\n");

#Estrofes
my @estrofesmain = ($string =~ /(.+\r\n){2,}/gm);
my @estrofes2 = ($string =~ /((?!(.+\n){2,})O.+)/gs);
my @estrofes = @estrofesmain;
push @estrofes, @estrofes2;
my $count_estrofes = @estrofesmain;
print("Estrofes: $count_estrofes\n");

#Sextilhas
my @sextilhas = ($string =~ /\r\n\r\n(.+\r\n){6}\r\n/gm);
my $count_sextilhas = @sextilhas; 
print("Sextilhas: $count_sextilhas\n");

#Sonetos
my @sonetos = ($string =~ /^\r\n\r\n(((.+\r\n){4}\r\n){2}((.+\r\n){3}\r\n){2})\r\n\r\n/gm);
my $count_sonetos = @sonetos;
print("Sextilhas: $count_sonetos\n");

#Tamanho médio dos versos.
my $soma_versos = 0;
foreach $linha ( @versos ){
    my $tam_versos = length $linha;
    $soma_versos = $soma_versos + $tam_versos;
}
my $media_versos = $soma_versos/$count_versos;
print("Tamanho médio dos versos: $media_versos\n");

#Tamanho médio das estrofes.
my $soma_estrofes = 0;
foreach $linha ( @versos ){
    my $tam_estrofes = length $linha;
    $soma_estrofes = $soma_estrofes + $tam_estrofes;
}
my $media_estrofes = $soma_estrofes/$count_estrofes;
print("Tamanho médio das estrofes: $media_estrofes\n");

#Tamanho médio das poesias.
my $soma_poesias = 0;
foreach $linha ( @versos ){
    my $tam_poesias = length $linha;
    $soma_poesias = $soma_poesias + $tam_poesias;
}
my $media_poesias = $soma_poesias/$count_poesias;
print("Tamanho médio das poesias: $media_poesias\n");
---
lang: fr
permalink: /language-syntax.html
layout: home
---
# Langage de programmation CYK
- Mobile ou Desktop
- Full Stack Web Application
- Langage orienté objet déclaratif
- Application Exemple : https://cyk-compta.herokuapp.com
  
## Sommaire
- [Langage de programmation CYK](#langage-de-programmation-cyk)
  - [Sommaire](#sommaire)
  - [Mobile ou Desktop](#mobile-ou-desktop)
  - [Full Stack Web Application](#full-stack-web-application)
  - [Conventions typographiques](#conventions-typographiques)
  - [Types de données](#types-de-données)
  - [Déclaration de données primitives](#déclaration-de-données-primitives)
    - [Déclaration de `string` (chaine de caractères)](#déclaration-de-string-chaine-de-caractères)
      - [Exemples](#exemples)
    - [Déclaration de `number` (nombre)](#déclaration-de-number-nombre)
      - [Exemples](#exemples-1)
    - [Déclaration de `datatime`](#déclaration-de-datatime)
  - [Instructions de Contrôle](#instructions-de-contrôle)
    - [Instruction Conditionelle](#instruction-conditionelle)
    - [Instruction While](#instruction-while)
    - [Instruction Loop](#instruction-loop)
    - [Instruction break](#instruction-break)
  - [Instruction Affectation](#instruction-affectation)
  - [Instruction Stringexec](#instruction-stringexec)
  - [Instruction Parallel](#instruction-parallel)
  - [Instruction Appel de Fonction](#instruction-appel-de-fonction)
    - [Function](#function)
    - [Methode d'Objet](#methode-dobjet)
    - [Méthode d'un Module](#méthode-dun-module)
  - [Format des expressions](#format-des-expressions)
    - [](#)







## Mobile ou Desktop

- Responsive Design
- Framework Quasar / Vue3 JS

## Full Stack Web Application

- Même langage pour Front End et Serveur
- Pas de Rest API ou GraphQL à programmer
- Base de données Postgresql

## Conventions typographiques

| Elément | Description |
|-------- |-------------|
| `literal` | nom de commandes ou options à taper tel quel |
| [ ] | les éléments optionnels sont entre crochets |
| *italic* | un élément en italique est défini par une autre règle syntaxique |
| \| | la barre verticale sépare des éléments optionnels alternatifs exclusifs les uns des autres |
| ... | les points de suspension indiquent que l'élément précédent peut être répété une ou plusieurs fois |
| { } | les accolades regroupent les éléments situés entre elles en un seul élément pour appliquer un opérateur ... ou \| |




## Types de données
- Texte :
- Nombre : `<number/>`
- Heure : `<datetime/>`
- Booléen : `<boolean/>`
- Object : `<object/>`
- Module : `<module/>`
- Fonction : `<function/>`
- Undefined

## Déclaration de données primitives

### Déclaration de `string` (chaine de caractères)

 `<string` [ `name="`*identifier* `"` ] [ `literal=""` ]`>` *expression*  | *text_literal*  | `</string>`

- Si l'attribut `literal` est spécifié, le contenu de la balise n'est pas évalué en tant qu'expression mais considéré comme un texte litéral
- Un contenu de balise vide est équivalent à la valeur `undefined`
- La XML CDATA est acceptée
- L'attribut `name` est facultatif : utile dans le cas de l'initialisation d'une liste de données anonymes

#### Exemples ####
```
<string name="person_1"> "John Doe" </string>
<string name="person_2" literal="">John Doe</string>
<string name="math_formula_1"> <![CDATA[ "x < y" ]]> </string>
<string name="math_formula_2" literal=""> <![CDATA[ x < y ]]> </string>
```
### Déclaration de `number` (nombre)

 `<number` [ `name="`*identifier* `"` ] `>` *expression*  | ` undefined` | `</number>`

#### Exemples ####
```
<number name="id"/>
<number name="intvalue"> 12 </number>
<number name="amount"> 10.25 </number>
```

### Déclaration de `datatime`


## Instructions de Contrôle

### Instruction Conditionelle

*conditional_instruction :*

`<if>`   
&emsp;`<condition>` *expression* `</condition>`   
&emsp;`<then>`   
&emsp;&emsp;*instruction* ...    
&emsp;`</then>`   
&emsp;[      
&emsp;`<condition>` *expression* `</condition>`   
&emsp;`<then>`   
&emsp;&emsp; *instruction* ...  
&emsp;`</then>`   
&emsp;] ...   
&emsp;[   
&emsp;`<else>`   
&emsp; *instruction* ...     
&emsp;`</else>`  
&emsp;]    
`</if>`

### Instruction While

*while_instruction :*

`<while>`  
&emsp;`<condition>` *expression* `</condition>`   
&emsp;`<then>`   
&emsp;&emsp;*instruction* ...   
&emsp;`</then>`   
`</while>`

Sortie de boucle par `<break/>`
Itération suivante par '<continue/>`


### Instruction Loop
*loop_instruction :* 

`<loop>`   
&emsp;*instruction* ...      
`</loop>`

### Instruction break
*break_instruction :*

`<break>`   
&emsp;[ *expression* ]   
`</break>`

Si *expression* est présente, elle est évaluée
Si le résultat est équivalent à VRAI, le programme quitte le bloc en cours
Si *expression* est absente, le programme quitte le bloc en cours
 
## Instruction Affectation

*set_instruction :*

`<set name="`*identifier*`">` *expression* `</set>`


## Instruction Stringexec


`<stringexec>` *expression* `</stringexec>`

L'expression est évaluée en tant que chaine, puis considérée comme un texte de programme qui est exécuté


## Instruction Parallel


`<parallel>`   
&emsp;*instruction* ...     
`</parallel>`

Chaque instruction dans le bloc est exécuté en parallèle des autres.
L'instruction `<parallel/>` se termine lorsque toutes les intrutions du bloc sont terminées.

## Instruction Appel de Fonction

### Function


`<call function="`*identifier*`"` [ `returns="`*identifier* `: `*datatype*`" ] >`   
&emsp;*declare_instruction* ...   
`</call>`


### Methode d'Objet

`<call object="` *identifier* `" method="`*identifier* `"` [ `returns="`*identifier* `: `*datatype*`"` ] `>`   
&emsp;*declare_instruction* ...    
`</call>`


### Méthode d'un Module

`<call module="` *identifier* `" method="`*identifier* `"` [ `returns="`*identifier* `: `*datatype*`"` ] `>`   
&emsp;*declare_instruction* ...    
`</call>`


## Format des expressions

### 
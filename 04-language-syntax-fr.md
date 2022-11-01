---
lang: fr
permalink: /reference/
title: Référence
layout: default
---
# Instructions du noyau du cadriciel
  
## Sommaire
- [Instructions du noyau du cadriciel](#instructions-du-noyau-du-cadriciel)
  - [Sommaire](#sommaire)
  - [Conventions typographiques](#conventions-typographiques)
  - [Types de données](#types-de-données)
  - [Déclaration de données primitives](#déclaration-de-données-primitives)
    - [Déclaration de `string` (chaine de caractères)](#déclaration-de-string-chaine-de-caractères)
      - [Exemples](#exemples)
    - [Déclaration de nombre](#déclaration-de-nombre)
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
  - [Définition de fonction](#définition-de-fonction)
    - [Exemple : la fonction factorielle](#exemple--la-fonction-factorielle)
  - [Instruction Appel de Fonction](#instruction-appel-de-fonction)
    - [Function](#function)
    - [Methode d'Objet](#methode-dobjet)
    - [Méthode d'un Module](#méthode-dun-module)
  - [Format des expressions](#format-des-expressions)
    - [](#)









## Conventions typographiques

| Elément | Description |
|-------- |-------------|
| `literal` | nom de commandes ou options à taper tel quel |
| [ ] | les éléments optionnels sont entre crochets. Les attributs optionnels sont encadrés par des crochets avec un fond différent |
| normal | un élément défini par une autre règle syntaxique |
| \| | la barre verticale sépare des éléments optionnels alternatifs exclusifs les uns des autres |
| ... | les points de suspension indiquent que l'élément précédent peut être répété une ou plusieurs fois |
| { } | les accolades regroupent les éléments situés entre elles en un seul élément pour appliquer un opérateur ... ou \| |

Le schéma du XML est ici : 
[https://www.cyklang.net/schema/cyklang.xsd](/schema/cyklang.xsd)



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
```xml
<string [ name="identifier" ] [ literal="" ] > 
  expression  | text_literal  | 
</string>
```
- Si l'attribut `literal` est spécifié, le contenu de la balise n'est pas évalué en tant qu'expression mais considéré comme un texte litéral
- Un contenu de balise vide est équivalent à la valeur `undefined`
- La XML CDATA est acceptée
- L'attribut `name` est facultatif : utile dans le cas de l'initialisation d'une liste de données anonymes

#### Exemples ####
```xml
<string name="person_1"> "John Doe" </string>
<string name="person_2" literal="">John Doe</string>
<string name="math_formula_1"> <![CDATA[ "x < y" ]]> </string>
<string name="math_formula_2" literal=""> <![CDATA[ x < y ]]> </string>
```
### Déclaration de nombre
```xml
<number [ name="identifier" ] > *expression* | undefined | </number>  
```
#### Exemples ####
```xml
<number name="id"/>
<number name="intvalue"> 12 </number>
<number name="amount"> 10.25 </number>
```

### Déclaration de `datatime`


## Instructions de Contrôle

<a name="ifInstruction"></a>
### Instruction Conditionelle

*conditional_instruction :* 

```xml
<if>   
  <condition> expression </condition>   
  <then>  
    instruction ...    
  </then>  
  [      
  <condition> expression </condition>   
  <then>   
    instruction ...  
  </then>   
  ] ...   
  [   
  <else>   
    instruction ...     
  </else>  
  ]    
</if>
```
<a name="whileInstruction"></a>
### Instruction While

*while_instruction :*

```xml
<while>    
  <condition> expression </condition>   
  <then>   
    instruction ...   
  </then>  
</while>
```

Sortie de boucle par `<break/>`
Itération suivante par '<continue/>`

<a name="loopInstruction"></a>
### Instruction Loop
*loop_instruction :* 
```xml
<loop>   
  instruction ...      
</loop>
```

<a name="breakInstruction"></a>
### Instruction break
*break_instruction :*
```xml
<break>   
  [ expression ]   
</break>
```
Si *expression* est présente, elle est évaluée
Si le résultat est équivalent à VRAI, le programme quitte le bloc en cours
Si *expression* est absente, le programme quitte le bloc en cours
 
 <a name="setInstruction"></a>
## Instruction Affectation

*set_instruction :*
```xml
<set name="identifier"> expression </set>
<let name="identifier"> expression </let>
```

Les noms de balise `set` et `let` ont la même signification
<a name="stringexecInstruction"></a>
## Instruction Stringexec

```xml
<stringexec> expression </stringexec>
```
L'expression est évaluée en tant que chaine, puis considérée comme un texte de programme qui est exécuté

<a name="parallelInstruction"></a>
## Instruction Parallel

```xml
<parallel>   
  instruction ...     
</parallel>
```
Chaque instruction dans le bloc est exécuté en parallèle des autres.
L'instruction `<parallel/>` se termine lorsque toutes les intrutions du bloc sont terminées.

## Définition de fonction

### Exemple : la fonction factorielle
```xml
    <function name="fact" returns="result: number">
        <number name="N"/>
        <block>
            <if>
                <condition><![CDATA[ N <= 0]]></condition>
                <then>
                    <let name="result">1</let>
                </then>
                <else>
                    <number name="fact1">1</number>
                    <call function="fact" returns="fact1">
                        <number name="N">N - 1</number>
                    </call>
                    <let name="result">N * fact1</let>
                </else>
            </if>
        </block>
    </function>
```
## Instruction Appel de Fonction

### Function

```xml
<call function="identifier" [ returns="identifier : datatype" ] >   
  declare_instruction ...   
</call>
```

### Methode d'Objet
```xml
<call object="identifier" method="identifier" [ returns="identifier : datatype" ] >   
  declare_instruction ...    
</call>
```

### Méthode d'un Module
```xml
<call module="identifier" method="identifier" [ returns="identifier: datatype*" ] >   
  declare_instruction ...    
</call>
```

## Format des expressions

### 
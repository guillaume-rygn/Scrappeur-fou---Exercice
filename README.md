#  Projets : Le scrappeur fou 🤯
## 1. Introduction

Aujourd'hui, tu vas automatiser la récupération massive de données issus de sites internet (= tu vas scraper). Tes compétences en Ruby et en HTML vont te permettre de récupérer ces informations en moins d'une journée. Tu t'amuseras avec le cours des cryptomonnaies, tu iras récupérer les e-mails des mairies de notre beau pays, puis en bonus tu pourras chopper la liste des e-mails des députés de France. Tu ne te penses pas capable de tout ça ? Et bien tu vas voir que si.

Les standards habituels seront attendus : un dossier bien rangé, de beaux README et Gemfile, des tests qui vérifient que tout fonctionne.

## 2. Les projets
### 1. Dark Trader 📈

Lehman Brothers, impressionnés par ton algorithme d'optimisation d'achat / vente, veut encore faire appel à toi. Leur Chief Digital Officer, très hype, a entendu parler au JT de TF1 d'un "truc révolutionnaire qui s'appelle le bloque-chienne". Il veut en acheter plein. Pour le conseiller, tu vas devoir récupérer le cours de toutes les cryptomonnaies du marché.

En prenant pour source le site CoinMarketCap, fait un programme qui récupère le cours de toutes les cryptomonnaies et les enregistre bien proprement dans un array de hashs.
Ton array devra avoir le format suivant :

```ruby
a = [
  { "BTC" => 5245.12 },
  { "ETH" => 217.34 }, 
  etc
]
```

Pour les tests, inspire-toi de la ressource plus haut. Il n'y a pas besoin de faire 36 000 tests, il faut juste arriver à tester 1) le fonctionnement de base de ton programme (pas d'erreur ni de retour vide) et 2) que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).

### 2. Mairie christmas 🏢

Le CEO de Get-email Corp a besoin de tes services. Il voudrait toutes les adresses e-mail des mairies du Val d'Oise. Aucun souci pour toi. Va sur cet annuaire des mairies et récupère les adresses e-mails des mairies du Val d'Oise. Comme pour l'exercice précédent, tu devras enregistrer les données dans un array de hash suivant ce format :

```ruby
a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]
```

## Crédit
[Guillaume Reygner](https://github.com/guillaume-rygn)
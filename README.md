Exempelapplikation för att visa data enligt GBIS 3.0
====================================================

Detta projekt är tänkt som en enkel demo för hur man kan skriva en applikation som visar upp data som finns tillgänglig i GBIS 3.0 format.

Köra lokalt
-----------

För att köra projektet lokalt krävs att man har en server som levererar data i GBIS 3.0 format.
För att sätta upp en sådan lokalt, se [https://github.com/Biobank-Sverige/gbis-server](https://github.com/Biobank-Sverige/gbis-server).

För att köra projektet behövs npm (node package manager), se [https://www.npmjs.com/get-npm](https://www.npmjs.com/get-npm). Projektet är testat med version 6.3.17

- Checka ut projektet lokalt.
- i [app.vue](src/App.vue), ändra "/samples" till "http://localhost:8080"  
- Kör `npm install`
- Givet att servern ovan är igång lokalt med standardporten (8080), kör: `npm run serve`
- Öppna länken som visas ([http://localhost:8081](http://localhost:8081)) i din webbläsare, där ska du nu se en lista på prover samt en graf över provtagningar per tid.

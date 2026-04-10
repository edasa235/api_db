Del 1 — Research
Hva er et REST API?
en rest api er en type API som står for Representational State Transfer (REST). Det er en api
for å designe nettbaserte tjenester, og det bruker HTTP for kommunikasjon mellom klienter og servere. REST
API-er er kjent for å være enkle, skalerbare og lette å forstå, og de bruker standard HTTP-metoder som GET, POST, PUT og
DELETE for å utføre operasjoner på ressurser.
Hva brukes HTTP-metodene GET, POST, PUT og DELETE til?
get brukes til å hente data fra serveren,
post brukes til å opprette nye ressurser på serveren,
put brukes til å oppdatere eksisterende ressurser på serveren
delete brukes til å slette ressurser fra serveren.
Hva er en HTTP-responskode? Hva betyr:
200 betyr at forespørselen var vellykket, og at serveren har returnert de etterspurte dataene.
201 betyr at en ny ressurs har blitt opprettet som et resultat av forespørselen, og at serveren har returnert
informasjon om den nye ressursen.
204 betyr at forespørselen var vellykket, men at det ikke er noen data å returnere. Dette brukes ofte for
DELETE-operasjoner.
400 betyr at forespørselen var ugyldig, og at serveren ikke kunne forstå den. Dette skjer fordi i forespørselens syntaks
eller manglende nødvendige data.
401 betyr at klienten ikke er autentisert, og at serveren krever autentisering for å få tilgang til ressursen.
403 betyr at klienten er autentisert men ikke har tillatelse til å få tilgang til ressursen.
404 betyr at den forespurte ressursen ikke ble funnet på serveren.
429 betyr at klienten har sendt for mange forespørsler på kort tid, og at serveren har begrenset tilgangen for å
beskytte seg mot overbelastning.
500 betyr at det har oppstått en intern serverfeil, og at serveren ikke kunne fullføre forespørselen på grunn av en feil
i serverens programvare eller konfigurasjon.
502 betyr at serveren som fungerer som en gateway eller proxy, mottok en ugyldig respons fra en oppstrømsserver.
503 betyr at serveren er midlertidig utilgjengelig, ofte på grunn av vedlikehold eller overbelastning.
504 betyr at serveren som fungerer som en gateway eller proxy, ikke mottok en respons i tide fra en oppstrømsserver.
Hva er 418, og hvorfor finnes den?
418 er april fools joke
Hva er OpenAPI, og hva er Swagger?
OpenAPI er en format for å beskrive REST API-er på en standardisert måte. Det gir en strukturert måte å
dokumentere API-endepunkter, forespørsler, responser og andre detaljer om API-et. Swagger er et verktøy som brukes til å
generere interaktiv dokumentasjon og klientbiblioteker basert på OpenAPI-spesifikasjonen. Det gjør det enklere for
utviklere å forstå og bruke API-et ved å gi en visuell representasjon av API-endepunktene og deres funksjonalitet.
Hva er et schema i API-dokumentasjon?
et schema er en struktuert dataformat som beskriver hvordan data se ut i en api forespørsel.
Hva betyr readOnly og writeOnly, og når brukes de?
readonly betyr at feltet kan kun leses, og at det kan ikke endres av klienten. en eksempel er id-feltet i en database,
som ofte settes av systemet og ikke skal endres på. writeonly betyr at feltet kan kun skrives til, og at det
ikke kan leses av klienten. dette brukes ofte for passord eller andre sensitive data som ikke skal eksponeres i
API-responser.
Hva er bearer authentication og JWT, og hvorfor brukes det i REST API-er?
Bearer authentication er en type autentisering der klienten sender en token i HTTP-headeren for å få tilgang til
beskyttede ressurser. JWT (JSON Web Token) er en type token som brukes i bearer authentication. Det er en kompakt,
URL-sikker token som inneholder informasjon om brukeren og eventuelle tillatelser de har. JWT brukes i REST API-er for å
sikre at bare autoriserte brukere kan få tilgang til bestemte ressurser, og for å gi en enkel måte å håndtere
autentisering og autorisasjon på tvers av forskjellige tjenester.
Hva er pagination, og hvorfor brukes det?
pagination er en teknikk for å dele opp store mengder data i sider, slik at klienten kan hente data i mindre biter i
stedet for å få alt på en gang. Dette brukes for å forbedre ytelsen og redusere belastningen på serveren, spesielt når
det er mange ressurser som skal hentes. Pagination gjør det også enklere for klienten å navigere gjennom store datasett
og finne relevant informasjon raskt.
Del 2A — Task schema
Hva betyr det at id, created_at og completed_at settes av systemet, og hvordan påvirker det schemaet?
id, created_at og completed_at settes av systemet betyr at disse feltene automatisk genereres og håndteres av serveren
når en task opprettes eller oppdateres. Dette påvirker schemaet ved at disse feltene ikke trenger å inkluderes i
request.
Når gir det mening at description er valgfri?
Det gir mening at description er valgfri fordi det ikke alltid er nødvendig å gi en beskrivelse for en task.
Hva betyr de ulike statusene i praksis?

BACKLOG: opprettet, ikke startet.
READY: klar til start.
IN_PROGRESS: under arbeid.
IN_REVIEW: ferdig, venter på gjennomgang.
IN_TESTING: testes.
COMPLETED: fullført.
Hva betyr det når completed_at er NULL, og når settes det av systemet?
Når completed_at er NULL, betyr det at tasken ikke er fullført ennå. Det settes av systemet til en tidsstempel når
tasken fullføres.
Del 2B — Endepunkter
GET /tasks
Hva returneres?
det returneres alle tasks i systemet, med mulighet for pagination og filtrering.
Hvordan fungerer pagination?
pagination fungerer ved at klienten kan spesifisere query-parametere som page og limit for å hente en bestemt side med
et bestemt antall tasks. Serveren returnerer også total antall tasks for å hjelpe klienten med å navigere gjennom
sidene.
GET /tasks/{id}
Hva skjer hvis task ikke finnes ?
Hvis task ikke finnes, returneres en 404 Not Found responskode.
POST /tasks
Hvordan ser request body ut?
Request body for å opprette en task kan se slik ut:

{
"title": "Ny task",
"description": "Beskrivelse av tasken",
"status": "BACKLOG"
}
Hva er responsen?
Responsen for en vellykket opprettelse av en task vil være en 201 Created responskode.
Hva skjer ved ugyldig eller manglende data (HTTP-kode)?
Hvis dataene i request body er ugyldige eller mangler nødvendige felt, vil serveren returnere en 400 Bad Request
responskode.
PUT /tasks/{id}
Hvordan ser request body ut?
Request body for å oppdatere en task kan se slik ut:

{
"title": "Oppdatert task",
"description": "Oppdatert beskrivelse",
"status": "IN_PROGRESS"
}
Hva er responsen?
Responsen for en vellykket oppdatering av en task vil være en 200 OK responskode, og den oppdaterte tasken kan
returneres i responsen.
Hva skjer hvis task ikke finnes?
Hvis task ikke finnes, returneres en 404 Not Found responskode.
Hva skjer ved ugyldig eller manglende data (HTTP-kode)?
Hvis dataene i request body er ugyldige eller mangler nødvendige felt, vil serveren returnere en 400 Bad Request
responskode.
DELETE /tasks/{id}
Hva skjer hvis task ikke finnes?
Hvis task ikke finnes, returneres en 404 Not Found responskode.
Del 2C — Responskoder
Hvilke responskoder har du brukt, og hvorfor?
200 OK → suksess ved GET og PUT
201 Created → suksess ved POST
204 No Content → suksess ved DELETE
400 Bad Request → ugyldig data
401 Unauthorized → manglende eller ugyldig JWT
404 Not Found → task med gitt ID finnes ikke

Når bruker du 200 vs 201 vs 204?
200 OK brukes når en GET eller PUT operasjon er vellykket og det returneres data i responsen.
201 Created brukes når en POST operasjon er vellykket og en ny ressurs har blitt opprettet.
204 No Content brukes når en DELETE operasjon er vellykket og det ikke
Når gir 400 og 404 mening?
400 Bad Request gir mening når klienten sender en forespørsel med ugyldige data eller mangler nødvendige felt, og
serveren ikke kan forstå eller behandle forespørselen.
404 Not Found gir mening når klienten ber om en ressurs som ikke finnes på serveren, for eksempel når en task med en
gitt ID ikke kan finnes.
Når gir 401, 403 og 429 mening?
401 Unauthorized gir mening når klienten ikke er autentisert, og serveren krever autentisering for å få tilgang til en
beskyttet ressurs.
403 Forbidden gir mening når klienten er autentisert, men ikke har tillatelse til å få tilgang til en bestemt ressurs.
429 Too Many Requests gir mening når klienten har sendt for mange forespørsler på kort tid, og serveren har begrenset
tilgangen for å beskytte seg mot overbelastning.
Del 2D — Sikkerhet og dataflyt
Hva er bearer authentication?
Bearer authentication er en type autentisering der klienten sender en token i HTTP-headeren for å få tilgang til
beskyttede ressurser.
Hva er JWT?
JWT (JSON Web Token) er en kompakt, URL-sikker token som inneholder informasjon om brukeren og eventuelletillatelser de
har. Det brukes i bearer authentication for å sikre at bare autorisertebrukere kan få tilgang til bestemte ressurser, og
for å gi en enkel måte åhåndtere autentisering og autorisasjon på tvers av forskjellige tjenester.
Hva er readOnly og writeOnly, og hvordan har du brukt det i schema?
readOnly betyr at feltet kan kun leses, og at det kan ikke endres av klienten. writeOnly betyr at feltet kan kun skrives
til, og at det ikke kan leses av klienten. I schemaet har jeg brukt readOnly for id, created_at og completed_at, siden
disse settes av systemet og ikke skal endres av klienten. Jeg har ikke brukt writeOnly i dette schemaet, men det kunne
vært brukt for sensitive data som passord hvis det var relevant for API-et.
Hvordan fungerer pagination (page, limit, total)?
Pagination fungerer ved at klienten kan spesifisere query-parametere som page og limit for å hente en bestemt side med
et
bestemt antall tasks. Serveren returnerer også total antall tasks for å hjelpe klienten med å navigere gjennom sidene.
For eksempel, hvis det er 100 tasks totalt.
Del 3 — Vurderinger
Hvordan har du gjort REST API-et enkelt å forstå?
Jeg har gjort REST API-et enkelt å forstå ved å bruke klare og konsistente endepunkter, HTTP-metoder og responskoder.
jeg har brukt OpenAPI-spesifikasjonen for å dokumentere API-et på en strukturert måte, noe som
gjør det lettere for utviklere å forstå og bruke API-et. og jeg har en ryddig filstruktur og DRY CODE
Hva ville blitt vanskeligere i et større REST API?
I et større REST API ville det blitt vanskeligere å holde oversikt over alle endepunktene, deres funksjonalitet og
hvordan de samhandler med hverandre. Det ville også vært mer utfordrende å sikre at API-dokumentasjonen er oppdatert og
nøyaktig, spesielt hvis det er mange utviklere som jobber på API-et samtidig. I tillegg ville det vært mer komplekst å
håndtere autentisering,autorisasjon og sikkerhet på tvers av mange ressurser og endepunkter.
Quiz
Hva brukes GET og POST til?
GET brukes til å hente data fra serveren, mens POST brukes til å opprette nye ressurser på serveren.
Hva er forskjellen på 200, 201 og 204?
200 OK betyr at forespørselen var vellykket, og at serveren har returnert de etterspurte dataene. 201 Created betyr at
en ny ressurs har blitt opprettet som et resultat av forespørselen, og at serveren har returnert informasjon om den nye
ressursen. 204 No Content betyr at forespørselen var vellykket.
Hva er pagination?
Pagination er en teknikk for å dele opp store mengder data i sider, slik at klienten kan hente data i mindre biter i
stedet for å få alt på en gang. Dette brukes for å forbedre ytelsen og redusere belastningen på serveren, spesielt når
det er mange ressurser som skal hentes.
Hvorfor trenger vi API-dokumentasjon?
API-dokumentasjon er viktig fordi det gir utviklere en klar og strukturert måte å forstå hvordan API-et fungerer, hvilke
endepunkter som er tilgjengelige, hvilke data som kreves og hva slags responser de kan forvente. Det gjør det enklere
for utviklere å bruke API-et riktig og effektivt, og det kan også bidra til å redusere feil og misforstå
elser når flere utviklere jobber på samme API.
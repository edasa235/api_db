### Hva er en HTTP-responskode? Hva betyr:

200 → Forespørsel OK, data returnert
201 → Ressurs opprettet
204 → OK, ingen data (ofte ved DELETE)
400 → Ugyldig forespørsel (feil data/syntaks)
401 → Ikke autentisert
403 → Ikke tilgang
404 → Ikke funnet
429 → For mange forespørsler
500 → Intern serverfeil
502 → Ugyldig svar fra annen server
503 → Server utilgjengelig (overbelastning/vedlikehold)
504 → Timeout fra annen server

---

### Hva er OpenAPI, og hva er Swagger?

OpenAPI er et standardformat for å beskrive REST API-er (endepunkter, requests, responses).
Swagger er et verktøy som bruker OpenAPI til å lage interaktiv dokumentasjon og teste API-et.

---

### Hva er et schema i API-dokumentasjon?

Et schema beskriver strukturen på data i requests og responses (felter, typer og krav).

---

### Hva betyr readOnly og writeOnly, og når brukes de?

readOnly → kan bare leses (f.eks. id)
writeOnly → kan bare skrives (f.eks. passord)

---

### Hva er bearer authentication og JWT, og hvorfor brukes det?

Bearer auth: klient sender token i header for tilgang.
JWT: token med brukerinfo og rettigheter.
Brukes for sikker autentisering og autorisasjon.

---

### Hva er pagination, og hvorfor brukes det?

Deler data i sider (page, limit).
Gir bedre ytelse og gjør store datasett enklere å håndtere.

---

### Hvordan fungerer pagination?

Klienten sender page og limit.
Server returnerer valgt side + total antall for navigering.

---

### Hvordan har du gjort REST API-et enkelt å forstå?

Klare endepunkter, riktige HTTP-metoder og responskoder.
Brukt OpenAPI for strukturert dokumentasjon + ryddig kode.

---

### Hva ville blitt vanskeligere i et større REST API?

Flere endepunkter → vanskeligere oversikt
Dokumentasjon → må holdes oppdatert
Sikkerhet og tilgang → mer komplekst

---

### Hvilke responskoder har du brukt, og hvorfor?

200 → GET/PUT OK
201 → POST opprettet
204 → DELETE OK uten data
400 → Feil data
401 → Ikke autentisert
404 → Ikke funnet

---

### Når bruker du 200 vs 201 vs 204?

200 → OK + data
201 → Opprettet ny ressurs
204 → OK uten data

---

### Når gir 400 og 404 mening?

400 → ugyldig request
404 → ressurs finnes ikke

---

### Når gir 401, 403 og 429 mening?

401 → ikke logget inn
403 → ingen tilgang
429 → for mange requests

---

### Hvordan fungerer pagination (page, limit, total)?

page = hvilken side
limit = antall per side
total = totalt antall ressurser

---

### Hva er JWT?

Token med brukerinfo og rettigheter, brukt til autentisering.

---

### Hva er bearer authentication?

Sender token i Authorization-header for tilgang til API.

---

### Hvorfor trenger vi API-dokumentasjon?

Forklarer hvordan API-et brukes (endepunkter, data, responser).
Gjør det enklere å bruke riktig og unngå feil.

---

Hvis du vil, kan jeg gjøre hele teksten din **kort og konsistent i samme stil (som et ferdig innleveringsdokument)** 👍

### Hva betyr readOnly og writeOnly, og når brukes de?

**readOnly** → feltet sendes kun fra server til klient, og kan ikke settes av klienten.  
Brukes for felt som systemet styrer selv (f.eks. `id`, `created_at`).

**writeOnly** → feltet kan kun sendes fra klient til server, og vises aldri i responsen.  
Brukes for sensitive data (f.eks. passord), slik at det ikke eksponeres.

---

### Hva er bearer authentication og JWT, og hvorfor brukes det?

**Bearer authentication** → klienten sender en token i `Authorization`-headeren  
(`Bearer <token>`) for å få tilgang til beskyttede ressurser.

**JWT (JSON Web Token)** → en type token som inneholder info om brukeren  
(f.eks. id og rettigheter), og er signert slik at serveren kan stole på den.

Brukes fordi det gir en **enkel og sikker måte** å håndtere autentisering  
(innlogging) og autorisasjon (tilgang), uten å lagre session på serveren.
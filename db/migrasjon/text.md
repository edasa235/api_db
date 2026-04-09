Del 1 — Research

Hva er en database?
En database er en organisert samling data som kan lagres, hentes og manipuleres strukturert.

Hva er en tabell?
En tabell består av rader og kolonner, der rader er data og kolonner er attributter.

Hva er en primary key?
En unik identifikator for hver rad som ikke kan være NULL og brukes ofte i andre tabeller som referanse.

Hva er en foreign key?
En kolonne som refererer til en primary key i en annen tabell, og sikrer dataintegritet mellom tabeller.

Hva er en index, og hvorfor brukes den?
En index gjør søk og filtrering raskere, f.eks. ved statusfiltrering.

Hva er en constraint?
En regel som begrenser verdier i kolonner eller tabeller for å sikre dataintegritet (f.eks. PRIMARY KEY, FOREIGN KEY,
NOT NULL, UNIQUE, CHECK).

Hva betyr dataintegritet?
At data er korrekte, konsistente og pålitelige, og relasjoner mellom tabeller opprettholdes.

Hva er en databasemigrasjon?
En strukturert måte å endre databasen på, som å legge til tabeller, kolonner eller constraints, for å holde den synkron
med applikasjonen.

Forskjellen på NULL og NOT NULL?
NULL tillater ingen verdi; NOT NULL krever alltid gyldig verdi.

Forskjellen på ENUM og CHECK?
ENUM begrenser kolonnen til faste verdier, CHECK lar deg lage regler. ENUM er enklere for faste sett, CHECK mer
fleksibel.

Forskjellen på ON DELETE SET NULL, CASCADE, RESTRICT?

SET NULL: foreign key settes til NULL når referert rad slettes.
CASCADE: alle refererende rader slettes.
RESTRICT: forhindrer sletting hvis referanser finnes.
Del 2A — 0001_users.sql

Users-tabellen:

id: SERIAL PRIMARY KEY – unik auto-increment ID.
name: VARCHAR(255) NOT NULL – må fylles inn.
email: VARCHAR(255) NOT NULL UNIQUE – må fylles inn og unik.
created_at: TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP – settes automatisk.

Hvilke constraints har du lagt til, og hva gjør de?

PRIMARY KEY: sikrer unik ID.
NOT NULL: krever verdi.
UNIQUE: hindrer duplikat e-post.
Del 2B — 0002_tasks.sql

Når gir det mening at description er NULL?
Når en task ikke har beskrivelse.

Hva betyr de ulike statusene?

BACKLOG: opprettet, ikke startet.
READY: klar til start.
IN_PROGRESS: under arbeid.
IN_REVIEW: ferdig, venter på gjennomgang.
IN_TESTING: testes.
COMPLETED: fullført.

Hva betyr assignee_id NULL?
Oppgaven er ikke tildelt noen bruker.

Hva betyr completed_at NULL?
Oppgaven er ikke fullført.

Hva skjer med tasks hvis en user slettes?

SET NULL: foreign key settes til NULL.
CASCADE: referanser slettes.
RESTRICT: sletting forhindres.
Del 2C — Status

Har du brukt ENUM eller CHECK?
Jeg har brukt CHECK constraint.

Hvorfor valgte du denne løsningen?
CHECK gir fleksibilitet til å endre gyldige statusverdier uten å endre datatype.

Fordeler?

Lett å endre gyldige verdier.
Sikrer dataintegritet.

Ulemper?

Mindre effektiv enn ENUM.
Mindre lesbart for faste sett verdier.
Del 2D — Index

Hvilke indekser har du lagt til?
På id og email i users-tabellen.

Hvorfor?
Id er primary key, email er unik og ofte brukt i søk.

Hvorfor ikke andre indekser?
Username brukes sjelden i søk, så index er unødvendig.

Når er en index nyttig?
Ved filtrering og søk i store datamengder.

Ulemper med indekser?

Tar ekstra lagringsplass.
Reduserer ytelse ved oppdatering.
Øker kompleksitet.
Overoptimalisering kan gi redusert ytelse.
Del 3 — Endringer (strategi)

Ikke i produksjon:

Hvordan endre tabellene?
Lag en ny migrasjon med endringene.

Er det trygt å endre eksisterende migrasjon?
Nei, det kan skape inkonsistens hvis den allerede er kjørt.

I produksjon:

Hva må du gjøre?
Lag ny migrasjon og kjør den på produksjonsdatabasen.

Hvorfor farlig å endre en migrasjon som allerede er kjørt?
Kan skape inkonsistens og feil i databasen.

Hva kan skje hvis du gjør det likevel?
Applikasjonen kan feile, og dataintegritet kan brytes.

Quiz

Forskjellen på primary key og foreign key?
Primary key er unik identifikator, foreign key refererer til primary key i en annen tabell.

Hvordan bidrar constraints til dataintegritet?
De forhindrer ugyldige eller inkonsistente data.

Når er en index nyttig?
Når man filtrerer eller søker gjennom store datamengder.

Hvorfor bruker vi migrasjoner i stedet for manuelle endringer?
Gir strukturert, kontrollert endring og hjelper med backup/gjenoppretting.

Hva kan gå galt hvis du endrer en migrasjon i produksjon?
Kan føre til database-inkonsistens, applikasjonsfeil og dataintegritetsproblemer.
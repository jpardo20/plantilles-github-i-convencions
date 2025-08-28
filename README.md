# plantilles-github-i-convencions

**Kit reutilitzable** per arrencar qualsevol projecte amb:
- Plantilles d'**issues** (bug, feature, task)
- Plantilla de **Pull Request**
- **Convencions** de branques i commits (Conventional Commits)
- **Definition of Done (DoD)**
- Fitxers d'estil i utilitat: `.editorconfig`, `.gitignore`
- **Script** d'instal·lació per crear-ho tot d'un sol cop

> Objectiu: estalviar temps i garantir consistència entre repos.

---

## 🧩 Contingut

- `.github/ISSUE_TEMPLATE/bug_report.md`
- `.github/ISSUE_TEMPLATE/feature_request.md`
- `.github/ISSUE_TEMPLATE/task.md`
- `.github/pull_request_template.md`
- `.editorconfig`
- `.gitignore`
- `CONTRIBUTING.md` *(si no existeix al repo, l'script en genera un de base)*
- `setup_github_templates.sh` *(script per instal·lar-ho tot)*

---

## 🚀 Com començar ràpid

1) **Clona** aquest repo (o descarrega el fitxer `setup_github_templates.sh`).  
2) **Copia** l'script al teu projecte i executa'l des de l'arrel:

```bash
# Copia l'script dins del teu repo (exemple amb curl):
curl -O https://raw.githubusercontent.com/<EL-TEU-USUARI>/<EL-NOM-DEL-REPO>/main/setup_github_templates.sh

# Dona permisos d'execució i executa
chmod +x setup_github_templates.sh
bash setup_github_templates.sh
```

L'script crearà:
- `.github/ISSUE_TEMPLATE/{bug_report.md, feature_request.md, task.md}`
- `.github/pull_request_template.md`
- `.editorconfig`
- `.gitignore` *(si no existeix)*
- `CONTRIBUTING.md` *(si no existeix)*

> Pots executar l'script tantes vegades com vulguis: és **idempotent** per als fitxers marcats "si no existeix".

---

## 📋 Què fa cada fitxer?

### `.editorconfig` — per què serveix?
Manté un **estil de codi coherent** entre editors (VS Code, IntelliJ, Vim…):
- `charset = utf-8`
- `end_of_line = lf`
- `indent_style = space`
- `indent_size = 2`
- `insert_final_newline = true`
- `trim_trailing_whitespace = true`

Això evita *diffs* innecessaris per espais o finals de línia diferents.

### `.gitignore`
Ignora fitxers generats/sensibles. L'script crea un `.gitignore` "mixt" amb entrades comunes per Node, Java i Python si no n'hi ha cap.

### Plantilles d'**Issues**
- **Bug report** → passos de reproducció, comportament esperat, entorn, etc.
- **Feature request** → context, proposta, alternatives.
- **Task** → objectiu i detalls (subtasques).

### Plantilla de **Pull Request**
Inclou: descripció, llista de canvis, `Closes #<num-issue>`, i un **checklist** d'higiene.

### `CONTRIBUTING.md`
Guia per contribuir que conté:
- **Convencions de branques**: `feature/…`, `fix/…`, `task/…`, `hotfix/…`
- **Conventional Commits**: `feat:`, `fix:`, `docs:`, `style:`, `refactor:`, `test:`, `chore:`
- **DoD**: quan es considera una tasca realment acabada
- Flux recomanat de treball: issue → branca → commits → PR → review → merge

---

## 🧭 Convencions resum

### Branques
- `feature/<descripcio-breu>` — noves funcionalitats
- `fix/<descripcio-breu>` — correccions de bug
- `task/<descripcio-breu>` — tasques no funcionals
- `hotfix/<descripcio-breu>` — urgències en producció

### Commits (Conventional Commits)
Exemples:
```text
feat(auth): afegit login amb Google OAuth
fix(popup): correcció mida del botó en pantalles petites
```

### Definition of Done (DoD)
- Codi a la branca correcta
- Tests escrits i passats
- Documentació actualitzada
- Commit(s) clars
- Issue lligat i tancat amb `Closes #<num>`
- PR revisat i aprovat

---

## 📦 Instal·lació manual (opcional)

Si prefereixes **copiar/enganxar** sense l'script, crea aquests fitxers i carpetes al teu repo:
```
.github/
  ISSUE_TEMPLATE/
    bug_report.md
    feature_request.md
    task.md
  pull_request_template.md
.editorconfig
.gitignore
CONTRIBUTING.md
```

El contingut exacte es troba dins d'aquest repo i a l'script.

---

## ❓ Preguntes freqüents (FAQ)

**Puc personalitzar les plantilles?**  
Sí. Són punts de partida. Adapta-les al teu projecte (labels, títols, fields…).

**I si el meu projecte no és JavaScript?**  
Cap problema: les convencions i plantilles són **agnòstiques**. El `.gitignore` generat cobreix Node, Java i Python per defecte (edita’l si cal).

**Puc executar l'script en un repo que ja té part d'aquests fitxers?**  
Sí. L'script **respecta** `CONTRIBUTING.md` i `.gitignore` si ja existeixen. La resta es **sobreescriuen** amb les versions d'aquest kit.

---

## 🛠️ Script d'instal·lació

Pots copiar-lo [`setup_github_templates.sh`](./setup_github_templates.sh) a l’arrel del teu repo i executar-lo.

---

## 🧪 Prova local amb Git

Per crear un repo nou amb aquest contingut:

### 1) Crea carpeta i entra-hi
```bash
mkdir plantilles-github-i-convencions && cd plantilles-github-i-convencions
```

### 2) Desa aquest README i l'script (o copia'ls des del repo remot)
* Si ja tens els fitxers localment, salta al **pas 3**.

### 3) Executa l'script per generar l'estructura
```bash
chmod +x setup_github_templates.sh
./setup_github_templates.sh
```

### 4) Inicialitza git i primer commit
```git
git init
git add .
git commit -m "feat: inicialitza kit de plantilles i convencions"
```

### 5) Crea el repo remot i puja-ho (**substitueix `<usuari>`**)
```git
git branch -M main
git remote add origin git@github.com:<usuari>/plantilles-github-i-convencions.git
git push -u origin main
```

---

## 🔖 Llicència
Pots usar-ho lliurement en projectes personals o professionals. Afegeix una llicència (MIT, Apache-2.0…) si ho necessites.

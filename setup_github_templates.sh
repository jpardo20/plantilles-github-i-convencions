#!/usr/bin/env bash
set -euo pipefail

echo "🚧 Creant estructura de plantilles de GitHub..."

# 1) Dirs
mkdir -p .github/ISSUE_TEMPLATE

# 2) Pull Request template
cat > .github/pull_request_template.md <<'EOF'
# Descripció

<!-- Explica què fa aquest PR -->

Closes #<número-issue>

---

# Canvis principals
- 

---

# Checklist
- [ ] Codi net i llegible
- [ ] Tests passats
- [ ] Documentació actualitzada
- [ ] Issue associat
EOF

# 3) Issue templates
cat > .github/ISSUE_TEMPLATE/bug_report.md <<'EOF'
---
name: 🐛 Bug report
about: Reportar un error al projecte
title: "[BUG] "
labels: bug
---

## Descripció
<!-- Explica quin és el problema -->

## Reproducció
Passos per reproduir:
1. 
2. 
3. 

## Comportament esperat
<!-- Què hauria de passar -->

## Captures de pantalla
<!-- Si aplica -->

## Entorn
- OS: 
- Browser/versió: 
- Altres detalls:
EOF

cat > .github/ISSUE_TEMPLATE/feature_request.md <<'EOF'
---
name: ✨ Feature request
about: Suggerir una nova funcionalitat
title: "[FEAT] "
labels: enhancement
---

## Context
<!-- Què necessitem millorar o afegir? -->

## Proposta
<!-- Descriu la solució ideal -->

## Alternatives
<!-- Altres opcions que s’han valorat -->
EOF

cat > .github/ISSUE_TEMPLATE/task.md <<'EOF'
---
name: 📋 Task
about: Definir una tasca de manteniment o altres
title: "[TASK] "
labels: task
---

## Objectiu
<!-- Quina feina s’ha de fer -->

## Detalls
<!-- Passos o subtasques si cal -->
EOF

# 4) Fitxers opcionals d'estil
cat > .editorconfig <<'EOF'
root = true

[*]
charset = utf-8
end_of_line = lf
indent_style = space
indent_size = 2
insert_final_newline = true
trim_trailing_whitespace = true
EOF

# Només crea .gitignore si no existeix
if [ ! -f .gitignore ]; then
cat > .gitignore <<'EOF'
# Node
node_modules/
dist/
coverage/
.env
.DS_Store
*.log

# Java
target/
*.class

# Python
__pycache__/
*.pyc
.venv/
EOF
fi

# 5) CONTRIBUTING.md (només si no existeix)
if [ ! -f CONTRIBUTING.md ]; then
cat > CONTRIBUTING.md <<'EOF'
# Contributing Guide

Aquest document defineix les **bones pràctiques, convencions i plantilles** per treballar en qualsevol projecte del nostre equip.

---

## 1. Convencions de branques

- **feature/**: per noves funcionalitats  
  Exemple: `feature/login-form`
- **fix/**: per correccions d’errors  
  Exemple: `fix/button-alignment`
- **task/**: per tasques diverses que no són ni bug ni feature  
  Exemple: `task/update-dependencies`
- **hotfix/**: per arreglar un problema urgent en producció  
  Exemple: `hotfix/api-crash`

---

## 2. Missatges de commit

Fem servir la convenció **Conventional Commits**:

- `feat:` → Nova funcionalitat  
- `fix:` → Correcció d’un bug  
- `docs:` → Documentació  
- `style:` → Canvis d’estil (espais, format, etc., sense codi funcional)  
- `refactor:` → Refactorització de codi  
- `test:` → Afegir o modificar proves  
- `chore:` → Tasques de manteniment (dependències, configs…)

**Exemple:**
```
feat(auth): afegit login amb Google OAuth
fix(popup): correcció mida del botó en pantalles petites
```

---

## 3. Definition of Done (DoD)

Una tasca/feature només es considera **acabada** quan compleix:

- ✅ Codi pujat a una branca amb nom correcte.  
- ✅ Tests escrits i passats.  
- ✅ Documentació i comentaris actualitzats.  
- ✅ Commit amb missatge adequat.  
- ✅ Issue associat tancat amb `Closes #<num>`.  
- ✅ Revisió de codi feta i PR aprovat.

---

## 4. Bones pràctiques generals

- Treballar sempre amb **branches**, mai directament a `main`.  
- Cada **PR** ha d’anar associat a un issue.  
- Evitar **commits massius** → dividir en canvis petits i clars.  
- Documentar al README qualsevol pas d’instal·lació/configuració nou.  
- Afegir **scripts npm útils** per tasques repetitives (ex: `npm run sync`).  

---

## 5. Plantilles d’Issues i PRs

### 📄 `.github/ISSUE_TEMPLATE/bug_report.md`
```markdown
---
name: 🐛 Bug report
about: Reportar un error al projecte
title: "[BUG] "
labels: bug
---

## Descripció
<!-- Explica quin és el problema -->

## Reproducció
Passos per reproduir:
1. 
2. 
3. 

## Comportament esperat
<!-- Què hauria de passar -->

## Captures de pantalla
<!-- Si aplica -->

## Entorn
- OS: 
- Browser/versió: 
- Altres detalls:
```

---

### 📄 `.github/ISSUE_TEMPLATE/feature_request.md`
```markdown
---
name: ✨ Feature request
about: Suggerir una nova funcionalitat
title: "[FEAT] "
labels: enhancement
---

## Context
<!-- Què necessitem millorar o afegir? -->

## Proposta
<!-- Descriu la solució ideal -->

## Alternatives
<!-- Altres opcions que s’han valorat -->
```

---

### 📄 `.github/ISSUE_TEMPLATE/task.md`
```markdown
---
name: 📋 Task
about: Definir una tasca de manteniment o altres
title: "[TASK] "
labels: task
---

## Objectiu
<!-- Quina feina s’ha de fer -->

## Detalls
<!-- Passos o subtasques si cal -->
```

---

### 📄 `.github/pull_request_template.md`
```markdown
# Descripció

<!-- Explica què fa aquest PR -->

Closes #<número-issue>

---

# Canvis principals
- 

---

# Checklist
- [ ] Codi net i llegible
- [ ] Tests passats
- [ ] Documentació actualitzada
- [ ] Issue associat
```

---

## 6. Altres fitxers recomanats

### 📄 `README.md` base
```markdown
# Nom del projecte

Descripció breu.

## Instal·lació
```bash
npm install
```

## Scripts
- `npm run dev` → entorn de desenvolupament  
- `npm run build` → compilar  
- `npm run sync` → sincronitzar public/ a dist/

## Contribució
Mira [CONTRIBUTING.md](./CONTRIBUTING.md).
```

---

### 📄 `package.json` – afegir script útil
```json
"scripts": {
  "sync": "rsync -av --delete public/ dist/"
}
```

---

## 7. Fitxers addicionals opcionals

- `.editorconfig` → per mantenir estil de codi consistent.  
- `.gitignore` → ignorar fitxers sensibles o generats.  
- `.prettierrc` o `.eslintrc.json` → estil i linter de codi.  

---

## 8. Flux de treball resumit

1. Crear issue (`bug`, `feature` o `task`).  
2. Crear branca des de `main`.  
3. Implementar canvis amb commits clars.  
4. Obrir PR amb la plantilla i relacionar issue.  
5. Revisió de codi i merge.  

---

## 9. Recursos

- Conventional Commits — https://www.conventionalcommits.org/
- GitHub Docs: Issue Templates — https://docs.github.com/en/issues/using-issues/about-issue-and-pull-request-templates
- GitHub Docs: Pull Requests — https://docs.github.com/en/pull-requests
EOF
fi

echo "✅ Plantilles creades a .github/ i fitxers auxiliars llestos."
echo "   - Pots editar CONTRIBUTING.md i README.md segons el projecte."

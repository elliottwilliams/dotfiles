# Defined in /var/folders/qt/83cpf99j101_gkm4n6d67x68z90dks/T//fish.DMGD0C/fch.fish @ line 2
function fch --argument query
	git branch | fzf +m -q "$query" | xargs git checkout
end

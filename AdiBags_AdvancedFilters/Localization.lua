--[[
AdiBags_Garrison - Adds Garrison group in your bags, using AdiBags inventory manager.
Copyright 2016 Kiber_ (4thekiber@gmail.com)
All rights reserved.
--]]

local addonName, addon = ...

local L = setmetatable({}, {
    __index = function(self, key)
        if key ~= nil then
            --[===[@debug@
            addon:Debug('Missing locale', tostring(key))
            --@end-debug@]===]
            rawset(self, key, tostring(key))
        end
        return tostring(key)
    end,
})
addon.L = L

local locale = GetLocale()

------------------------ enUS ------------------------

L['Expansion prefix'] = true
L['Displays prefix of expansion before category name'] = true
L['Organize by expansion'] = true
L['Group items according to the expansion that have been released'] = true
L['Force the organization by expansion'] = true
L['Force grouping items so that they are sorted according to the expansion'] = true
L['Set as: Old expansion'] = true
L['Groups items from the following expansions as: Old expansion'] = true
L['Force Old expansion group'] = true
L['Force grouping from the following expansions as: Old expansion'] = true
L['Force subgroup'] = true
L['This category will stay in a separate group (takes precedence over all other forcing tags)'] = true
L['Split: '] = true
L['Includes the following subcategories in the main filter'] = true
L['Divides the following subcategories into specific filters'] = true
L['Debug'] = true
L['Show debug messages'] = true

L['Classic'] = true
L['The Burning Crusade'] = true
L['Wrath of the Lich King'] = true
L['Cataclysm'] = true
L['Mists of Pandaria'] = true
L['Warlords of Draenor'] = true
L['Legion'] = true
L['Battle for Azeroth'] = true
L['Other'] = true
L['Old Expansions'] = true

-- Items
L['Weapons'] = true
L['Armors'] = true
L['Containers'] = true
L['Consumables'] = true
L['Currency'] = true
L['Gems'] = true
L['Glyphs'] = true
L['Keys'] = true
L['Miscellaneous'] = true
L['Quest'] = true
L['Recipes'] = true
L['Trade Goods'] = true

-- Consumable category
L['Bandages'] = true
L['Consumables'] = true
L['Elixirs'] = true
L['Flasks'] = true
L['Food & Drinks'] = true
L['Item Enchantments'] = true
L['Potions'] = true
L['Scrolls'] = true
L['Other'] = true

L['Colored Gems'] = true
L['Relic'] = true
L['Simple Gems'] = true

L['Meta'] = true
L['Red'] = true
L['Blue'] = true
L['Yellow'] = true
L['Purple'] = true
L['Green'] = true
L['Orange'] = true
L['Prismatic'] = true
L['Sha-Touched'] = true
L['Cogwheel'] = true

L['Arcane Relic'] = true
L['Blood Relic'] = true
L['Fel Relic'] = true
L['Fire Relic'] = true
L['Frost Relic'] = true
L['Holy Relic'] = true
L['Iron Relic'] = true
L['Life Relic'] = true
L['Shadow Relic'] = true
L['Water Relic'] = true
L['Storm Relic'] = true

L['Armor Tokens'] = true
L['Holiday'] = true
L['Reagents'] = true
L['Mounts'] = true
L['Companions'] = true
L['Miscellaneous'] = true

-- Recipes category
L['Books'] = true
L['Alchemy'] = true
L['Blacksmithing'] = true
L['Cooking'] = true
L['Enchanting'] = true
L['Engineering'] = true
L['First Aid'] = true
L['Fishing'] = true
L['Inscriptions'] = true
L['Jewelcrafting'] = true
L['Leatherworking'] = true
L['Mining'] = true
L['Tailoring'] = true

-- Trade goods category
L['Armor Enchantments'] = true
L['Cloth'] = true
L['Devices'] = true
L['Elemental'] = true
L['Enchanting'] = true
L['Explosives'] = true
L['Herbs'] = true
L['Jewelcrafting'] = true
L['Leather'] = true
L['Materials'] = true
L['Cooking'] = true
L['Metal & Stone'] = true
L['Engineering'] = true
L['Weapon Enchantments'] = true
L['Others'] = true

-- Professions category
L['Alchemy'] = true
L['Blacksmithing'] = true
L['Enchanting'] = true
L['Engineering'] = true
L['Herbalism'] = true
L['Inscription'] = true
L['Jewelcrafting'] = true
L['Leatherworking'] = true
L['Mining'] = true
L['Skinning'] = true
L['Tailoring'] = true
L['Archaeology'] = true
L['Cooking'] = true
L['First Aid'] = true
L['Fishing'] = true
L['Riding'] = true

-- Custom
L['Archaeology'] = true
L['Archaeology Artifact'] = true
L['Crates'] = true
L['Key Stones'] = true
L['Archaeology Quest Items'] = true
L['Other Archaeology Items'] = true

L['Darkmoon Faire'] = true

L['Teleport'] = true
L['Heartstones'] = true
L['Armor with Teleport'] = true
L['Teleport Jewelry'] = true
L['Teleport Quests'] = true
L['Scrolls of Teleport'] = true
L['Toys with Teleport'] = true
L['Whistle with Teleport'] = true

L['Fishing'] = true
L['Poles'] = true
L['Fishing Hats'] = true
L['Other Fishing Items'] = true
L['Animal Meat'] = true
L['Eggs'] = true
L['Fish Meat'] = true

-- All expansions category

L['Battle-Stone'] = true
L['Pet Consumable'] = true
L['Pet Supplies'] = true
L['Training-Stone'] = true

-- Legion

L['Order Hall'] = true
L['Champion Armor'] = true
L['Champion Equipment'] = true
L['Champion Chest'] = true
L['Order Hall Consumables'] = true
L['Troops Items'] = true

-- Warlords of Draenor
L['Garrison'] = true
L['Blueprints'] = true
L['Followers'] = true
L['Iron Horde'] = true
L['Mining'] = true
L['Shipyard'] = true
L['Workorders'] = true

L['Ashran'] = true
L['Ashran Books'] = true

L['Filter'] = true
L['Classification'] = true
L['Initialization'] = true
L['Categorization'] = true
------------------------ ptBR ------------------------
if locale == "ptBR" then

L['Expansion prefix'] = 'Prefixo de expansão'
L['Displays prefix of expansion before category name'] = 'Exibe o prefixo da expansão antes do nome da categoria'
L['Organize by expansion'] = 'Organizar por Expansão'
L['Group items according to the expansion that have been released'] = 'Agrupa os itens das expansões selecionadas em um grupo com o nome da expansão'
L['Force the organization by expansion'] = 'Forçar organização por expansão'
L['Force grouping items so that they are sorted according to the expansion'] = 'Obriga que os itens das expansões selecionadas sejam colocados dentro da categoria da expansão, passando por cima das outras configurações'
L['Set as: Old expansion'] = 'Definir como: Antigo'
L['Groups items from the following expansions as: Old expansion'] = 'Agrupa os itens das expansões selecionadas em apenas uma categoria: Antigo'
L['Force Old expansion group'] = 'Forçar categoria Antigo'
L['Force grouping from the following expansions as: Old expansion'] = 'Obriga que os itens das expansões selecionadas sejam colocados dentro da categoria unica Antigo, passando por cima das outras configurações'
L['Force subgroup'] = 'Forçar Subgrupo'
L['This category will stay in a separate group (takes precedence over all other forcing tags)'] = 'Itens dessas categorias serão agrupados em um grupo separado (tem prioridade sobre todas as outras opções de forçar)'
L['Split: '] = 'Dividir: '
L['Divides the following subcategories into specific filters'] = 'Agrupa as seguintes subcategorias em um grupo especifico'

L['Classic'] = 'Classico'
L['The Burning Crusade'] = 'A Crusada Ardente'
L['Wrath of the Lich King'] = 'A Fúria do Lich Rei'
L['Cataclysm'] = 'Cataclismo'
L['Mists of Pandaria'] = 'Nevoas de Pandaria'
L['Warlords of Draenor'] = 'Senhores da Guerra de Draenor'
L['Legion'] = 'Legião'
L['Battle for Azeroth'] = 'Batalha por Azeroth'
L['Other'] = 'Outro'
L['Old Expansions'] = 'Antigo'

-- Items
L['Weapons'] = 'Armas'
L['Armors'] = 'Armaduras'
L['Containers'] = 'Recipientes'
L['Consumables'] = 'Consumíveis'
L['Currency'] = 'Moeda'
L['Gems'] = 'Gemas'
L['Glyphs'] = 'Glifos'
L['Keys'] = 'Chaves'
L['Miscellaneous'] = 'Misto'
L['Quest'] = 'Missão'
L['Recipes'] = 'Receitas'
L['Trade Goods'] = 'Bens de Comércio'

-- Consumable category
L['Bandages'] = 'Curativos'
L['Consumables'] = 'Consumíveis'
L['Elixirs'] = 'Elixires'
L['Flasks'] = 'Frascos'
L['Food & Drinks'] = 'Comidas e Bebidas'
L['Item Enchantments'] = 'Melhorias de Item'
L['Potions'] = 'Poções'
L['Scrolls'] = 'Pergaminhos'
L['Other'] = 'Outros'

L['Colored Gems'] = 'Gemas com cores'
L['Relic'] = 'Relíquias'
L['Simple Gems'] = 'Gemas simples'

L['Meta'] = 'Meta'
L['Red'] = 'Vermelho'
L['Blue'] = 'Azul'
L['Yellow'] = 'Amarelo'
L['Purple'] = 'Roxo'
L['Green'] = 'Verde'
L['Orange'] = 'Laranja'
L['Prismatic'] = 'Prismático'
L['Sha-Touched'] = 'Tocado pelo Sha'
L['Cogwheel'] = 'Engrenagem'

L['Arcane Relic'] = 'Relíquia Arcana'
L['Blood Relic'] = 'Relíquia de Sangue'
L['Fel Relic'] = 'Relíquia Vil'
L['Fire Relic'] = 'Relíquia de Figi'
L['Frost Relic'] = 'Relíquia de Gelo'
L['Holy Relic'] = 'Relíquia Sagrada'
L['Iron Relic'] = 'Relíquia de Ferro'
L['Life Relic'] = 'Relíquia de Vida'
L['Shadow Relic'] = 'Relíquia de Sombra'
L['Water Relic'] = 'Relíquia de Água'
L['Storm Relic'] = 'Relíquia Tempestade'

L['Armor Tokens'] = 'Moedas para itens'
L['Holiday'] = 'Feriado'
L['Reagents'] = 'Reagentes'
L['Mounts'] = 'Montarias'
L['Companions'] = 'Mascotes'
L['Miscellaneous'] = 'Outros'

-- Recipes category
L['Books'] = 'Livros'
L['Alchemy'] = 'Alquimia'
L['Blacksmithing'] = 'Ferraria'
L['Cooking'] = 'Culinária'
L['Enchanting'] = 'Encantamento'
L['Engineering'] = 'Engenharia'
L['First Aid'] = 'Primeiros Socorros'
L['Fishing'] = 'Pesca'
L['Inscriptions'] = 'Escrivania'
L['Jewelcrafting'] = 'Joalheria'
L['Leatherworking'] = 'Couraria'
L['Mining'] = 'Mineração'
L['Tailoring'] = 'Alfaiataria'

-- Trade goods category
L['Armor Enchantments'] = 'Encantamento de Armadura'
L['Cloth'] = 'Tecido'
L['Devices'] = 'Dispositivos'
L['Elemental'] = 'Elemental'
L['Enchanting'] = 'Encantamento'
L['Explosives'] = 'Explosivos'
L['Herbs'] = 'Plantas'
L['Jewelcrafting'] = 'Joias'
L['Leather'] = 'Couro'
L['Materials'] = 'Materiais'
L['Cooking'] = 'Comida'
L['Metal & Stone'] = 'Metal & Pedra'
L['Engineering'] = 'Engenharia'
L['Weapon Enchantments'] = 'Encantamento de Armas'
L['Others'] = 'Outros'

-- Professions category
L['Alchemy'] = 'Alquimia'
L['Blacksmithing'] = 'Ferraria'
L['Enchanting'] = 'Encantamento'
L['Engineering'] = 'Engenharia'
L['Herbalism'] = 'Herborismo'
L['Inscription'] = 'Escrivania'
L['Jewelcrafting'] = 'Joalheria'
L['Leatherworking'] = 'Couraria'
L['Mining'] = 'Mineração'
L['Skinning'] = 'Esfolamento'
L['Tailoring'] = 'Alfaiataria'
L['Archaeology'] = 'Arqueologia'
L['Cooking'] = 'Culinária'
L['First Aid'] = 'Primeiros Socorros'
L['Fishing'] = 'Pesca'
L['Riding'] = 'Montaria'

-- Custom
L['Archaeology Artifact'] = 'Artefatos de Arqueologia'
L['Crates'] = 'Caixotes'
L['Key Stones'] = 'Chaves de Arqueologia'
L['Archaeology Quest Items'] = 'Quests de Arqueologia'
L['Other Archaeology Items'] = 'Outros Itens de Arqueologia'

L['Darkmoon Faire'] = 'Feira de Negraluna'

L['Teleport'] = 'Teleporte'
L['Heartstones'] = 'Pedras de Regresso'
L['Armor with Teleport'] = 'Armaduras com teleporte'
L['Teleport Jewelry'] = 'Joias Teleportadoras'
L['Teleport Quests'] = 'Itens de Teleporte de Quests'
L['Scrolls of Teleport'] = 'Pergaminhos de Teleporte'
L['Toys with Teleport'] = 'Brinquedos de Teleporte'
L['Whistle with Teleport'] = 'Apitos'

L['Fishing'] = 'Pesca'
L['Poles'] = 'Varas'
L['Fishing Hats'] = 'Chapéu de Pesca'
L['Other Fishing Items'] = 'Outros Itens de Pesca'
L['Animal Meat'] = 'Carne de Animal'
L['Eggs'] = 'Ovos'
L['Fish Meat'] = 'Carne de Peixe'

-- All expansions category

L['Battle-Stone'] = 'Pedras de Batalha'
L['Pet Consumable'] = 'Consumíveis para Mascotes'
L['Pet Supplies'] = 'Suprimentos para Mascotes'
L['Training-Stone'] = 'Pedra de Treinamento'

-- Legion

L['Order Hall'] = 'Salões da Ordem'
L['Champion Armor'] = 'Armaduras para Compeões'
L['Champion Equipment'] = 'Armas para Campeões'
L['Champion Chest'] = 'Suprimentos da Ordem'
L['Order Hall Consumables'] = 'Consumíveis da Ordem'
L['Troops Items'] = 'Itens para Tropas'

-- Warlords of Draenor
L['Garrison'] = 'Guarnição'
L['Blueprints'] = 'Diagramas'
L['Followers'] = 'Seguidores'
L['Iron Horde'] = 'Horda de Ferro'
L['Mining'] = 'Mineração'
L['Shipyard'] = 'Estaleiro'
L['Workorders'] = 'Ordens de Serviço'

L['Ashran'] = 'Ashran'
L['Ashran Books'] = 'Livros de Ashran'

L['Filter'] = 'Filtro'
L['Classification'] = 'Classificação'
L['Initialization'] = 'Inicialização'
L['Categorization'] = 'Categorização'

------------------------ frFR ------------------------
elseif locale == "frFR" then


------------------------ deDE ------------------------
elseif locale == "deDE" then

------------------------ esMX ------------------------
elseif locale == "esMX" then


------------------------ ruRU ------------------------
elseif locale == "ruRU" then


------------------------ esES ------------------------
elseif locale == "esES" then


------------------------ zhTW ------------------------
elseif locale == "zhTW" then


------------------------ zhCN ------------------------
elseif locale == "zhCN" then


------------------------ koKR ------------------------
elseif locale == "koKR" then


end

-- Replace remaining true values by their key
for k,v in pairs(L) do if v == true then L[k] = k end end
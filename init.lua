-- Make obsidian drop coins
minetest.register_node(":default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
--	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'rare_coins:coin'},
				rarity = 150,
			},
			{
				items = {'default:obsidian'},
			}
		}
	},
})


-- Lottery Block
minetest.register_node("rare_coins:lotteryblock", {
   description = "Lottery Block",
   tiles = {"rare_coins_lotteryblock.png"},
   groups = {cracky = 3, stone = 1},
   sounds = default.node_sound_stone_defaults(),
   on_rightclick = function(pos, node, player, itemstack)
      local itemname = itemstack:get_name()
      local inv = player:get_inventory()
      local name = player:get_player_name()
      if itemname == "rare_coins:coin" then
         itemstack:take_item()
         player:set_wielded_item(itemstack)
         minetest.chat_send_player(name,"You rolled the dice at the lottery.")   
         minetest.chat_send_player(name,"**********************************")   
            local random_number = math.random(1, 100) -- Between 1 and 4.
            if (random_number >= 1) and (random_number <= 10) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and won the first prize:")
            minetest.chat_send_all("5x Nyancat Rainbows!")
            inv:add_item("main", "default:nyancat_rainbow 5")
            return
            elseif (random_number >= 11) and (random_number <= 31) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and were awarded with Five Diamond Blocks!")
            inv:add_item("main", "default:diamondblock 5")
            return
            elseif (random_number >= 32) and (random_number <= 65) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and were awarded with Twenty Steel Blocks!")
            inv:add_item("main", "default:steelblock 20")
            return
            elseif (random_number >= 66) and (random_number <= 100) then
            minetest.chat_send_all(name .. " spent a coin at the lottery and were awarded with Fifty Obsidian!")
            inv:add_item("main", "default:obsidian 50")
            return
         end
      else
         minetest.chat_send_player(name,"You are not holding a coin..")
      end
   end,
})

minetest.register_craftitem("rare_coins:coin", {
	description = "Golden Coin",
	inventory_image = "rare_coins_coin.png",
	groups = {heavy=1},
})

minetest.register_craftitem("rare_coins:malahcoin", {
	description = "Big Malah Coin",
	inventory_image = "rare_coins_malahcoin.png",
})


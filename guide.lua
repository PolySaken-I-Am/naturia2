
guideBooks.Common.register_guideBook("naturia2:guide", {
	inventory_image="n2_guidestone.png",
	description_short="Coextant",
	description_long=minetest.colorize("#888888", "Naturia 2 Guide"),
	style={
		cover={
			bg="n2_fbg2.png",
			next="n2_frn.png",
			w=10,
			h=10
		},
		page={
			bg="n2_fbg.png",
			next="n2_frn.png",
			prev="n2_frp.png",
			start="n2_frb.png",
			w=10,
			h=10
		},
		buttonGeneric="n2_fbg.png",
	},
	ptype=true,
})

guideBooks.Common.register_section("naturia2:guide","tutorial", {
	description="Getting Started"
})
guideBooks.Common.register_page("naturia2:guide", "tutorial", 1, {
	text1=[[
		
	]], 
	extra=[[]]
})

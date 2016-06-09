technic_light_register_lamp({
demand = 50,
tier = "LV",
light = default.LIGHT_MAX - 1,
node_name = "lv_lamp",
machine_name = "LV Lamp"
})

technic_light_register_lamp({
demand = 100,
tier = "MV",
light = default.LIGHT_MAX,
node_name = "mv_lamp",
machine_name = "MV Lamp"
})

technic_light_register_lamp({
demand = 100,
tier = "MV",
light = default.LIGHT_MAX,
node_name = "mv_flat_lamp",
machine_name = "MV Flat Lamp",
drawtype = "nodebox",
node_box = {
	type = "fixed",
	fixed = {{-0.5, -0.5, -0.5, 0.5, 0, 0.5},},
},
paramtype2 = "facedir",
tiles_on = {
	"technic_light_lamp_on.png",
	"technic_light_lamp_on.png",
	"technic_light_lamp_on_h.png",
	"technic_light_lamp_on_h.png",
	"technic_light_lamp_on_h.png",
	"technic_light_lamp_on_h.png",
},
tiles_off = {
	"technic_light_lamp_off.png",
	"technic_light_lamp_off.png",
	"technic_light_lamp_off_h.png",
	"technic_light_lamp_off_h.png",
	"technic_light_lamp_off_h.png",
	"technic_light_lamp_off_h.png",
},
})

technic_light_register_lamp({
demand = 50,
tier = "LV",
light = default.LIGHT_MAX,
node_name = "lv_flat_lamp",
machine_name = "LV Flat Lamp",
drawtype = "nodebox",
node_box = {
	type = "fixed",
	fixed = {{-0.5, -0.5, -0.5, 0.5, 0, 0.5},},
},
paramtype2 = "facedir",
tiles_on = {
	"technic_light_lamp_on.png",
	"technic_light_lamp_on.png",
	"technic_light_lamp_on_h.png",
	"technic_light_lamp_on_h.png",
	"technic_light_lamp_on_h.png",
	"technic_light_lamp_on_h.png",
},
tiles_off = {
	"technic_light_lamp_off.png",
	"technic_light_lamp_off.png",
	"technic_light_lamp_off_h.png",
	"technic_light_lamp_off_h.png",
	"technic_light_lamp_off_h.png",
	"technic_light_lamp_off_h.png",
},
})






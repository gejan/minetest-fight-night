


technic_light_register_lamp({
demand = 50,
tier = "LV",
light = default.LIGHT_MAX - 2,
node_name = "lv_lamp",
machine_name = "LV Lamp"
})

technic_light_register_lamp({
demand = 100,
tier = "MV",
light = default.LIGHT_MAX - 1,
node_name = "mv_lamp",
machine_name = "MV Lamp"
})

technic_light_register_lamp({
demand = 300,
tier = "HV",
light = default.LIGHT_MAX,
node_name = "hv_lamp",
machine_name = "HV Lamp"
})





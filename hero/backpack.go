components {
  id: "backpack"
  component: "/hero/backpack.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"backpack\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/hero/hero.atlas\"\n"
  "}\n"
  ""
}


abstract class Mapper<Entity, Model> {
  Model toModel(Entity entity);
  Entity fromModel(Model model);
}

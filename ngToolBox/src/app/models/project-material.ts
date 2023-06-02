import { BuildingMaterial } from "./building-material";
import { Project } from "./project";
import { ProjectMaterialId } from "./project-material-id";

export class ProjectMaterial {

  private id: ProjectMaterialId | null;
  private count: number;
  private project: Project | null;
  private buildingMaterial: BuildingMaterial | null;

  constructor(
    id:ProjectMaterialId | null = null,
    count:number=0,
    project: Project | null = null,
    buildingMaterial: BuildingMaterial | null = null
  ){
    this.id=id;
    this.count = count;
    this.project = project;
    this.buildingMaterial=buildingMaterial;
  }
}

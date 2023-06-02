import { Builder } from "./builder";
import { ProjectMaterial } from "./project-material";

export class Project {

	private id: number;
	private scheduleDate: string;
	private startDate: string;
	private finishDate: string;
	private paymentDate: string;
	private estimatedCost: number;
	private finalCost: number;
	private hours: number;
	private createDate: string;
	private updateDate: string;
  //references
  private builder: Builder | null;
  private projectMaterials: ProjectMaterial[] | null;

  constructor(
    id:number=0,
    scheduleDate: string='',
    startDate: string='',
    finishDate:string ='',
    paymentDate: string='',
    estimatedCost: number=0,
    finalCost: number=0,
    hours: number=0,
    createDate: string='',
    updateDate: string='',
    builder: Builder | null = null,
    projectMaterials: ProjectMaterial[] =[]
  ){
    this.id=id;
    this.scheduleDate=scheduleDate;
    this.startDate=startDate;
    this.finishDate=finishDate;
    this.paymentDate=paymentDate;
    this.estimatedCost=estimatedCost;
    this.finalCost=finalCost;
    this.hours=hours;
    this.createDate=createDate;
    this.updateDate=updateDate;
    this.builder=builder;
    this.projectMaterials=projectMaterials;
  }
}

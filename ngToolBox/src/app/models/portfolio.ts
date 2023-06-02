import { PortfolioItem } from "./portfolio-item";

export class Portfolio {

  private id:number;
  private name:string;
  private description:string;
  private createDate:string;
  private updateDate:string;
  private portfolioItems: PortfolioItem[] | null;

  constructor(
    id:number=0,
    name:string='',
    description:string='',
    createDate:string='',
    updateDate:string='',
    portfolioItems=[]
  ){
    this.id=id;
    this.name=name;
    this.description=description;
    this.createDate=createDate;
    this.updateDate=updateDate;
    this.portfolioItems=portfolioItems;
  }
}

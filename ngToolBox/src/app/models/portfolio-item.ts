export class PortfolioItem {
  private id: number;
  private title: string;
  private description: string;
  private imgURL: string;

  constructor(
    id:number =0,
    title:string='',
    description:string='',
    imgURL:string=''
  ){
    this.id=id;
    this.title=title;
    this.description=description;
    this.imgURL = imgURL;
  }

}

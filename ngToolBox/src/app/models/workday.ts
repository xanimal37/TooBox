export class Workday {

  id: number;
  startTime: string;
  finishTime: string;
  createDate: string;
  updateDate: string;
  note: string;

  constructor(
    id:number=0,
    startTime: string='',
    finishTime: string='',
    createDate:string ='',
    updateDate: string='',
    note: string=''
  ){
    this.id = id;
    this.startTime = startTime;
    this.finishTime = finishTime;
    this.createDate= createDate;
    this.updateDate=updateDate;
    this.note=note;
  }
}

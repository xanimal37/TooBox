export class User {
  id:number;
  username:string;
  password: string;
  role: string;
  enabled: boolean;
  email: string;

  constructor(
    id:number=0,
    username: string='',
    password: string='',
    role:string ='',
    enabled: boolean = true,
    email: string=''
  ){
    this.id = id;
    this.username=username;
    this.role=role;
    this.password=password;
    this.enabled=enabled;
    this.email=email;
  }
}

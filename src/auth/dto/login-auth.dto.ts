 import { MinLength, MaxLength, IsNotEmpty } from "class-validator";
import { Entity, Column } from 'typeorm';

@Entity()
export class LoginAuthDto{

    @Column({name: 'Username', type: 'varchar', unique: true, length: 20})
    @IsNotEmpty()
    username: string
    
    @Column({name: 'Password', type: 'longtext'})
    @IsNotEmpty()
    @MinLength(4, {
        message: 'La contraseña debe tener al menos 4 caracteres',
      })
    password: string


} 
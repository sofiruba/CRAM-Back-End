import { Injectable } from '@nestjs/common';
import { Seguido } from './seguido.entity';
import { InjectRepository } from '@nestjs/typeorm'
import { Repository } from 'typeorm';


@Injectable()
export class SeguidoService {
    constructor(
        @InjectRepository(Seguido)
        private seguidos: Repository<Seguido>,
    ) { }


    getSeguidores(id: number): Promise<Seguido> {
        return this.seguidos.findOneBy( {IdSeguido: id});
    }

    getSeguidos(id: number): Promise<Seguido> {
        return this.seguidos.findOneBy( {IdUsuario: id});
    }

    seguir(seguido: Seguido) {
        return this.seguidos.save(seguido);
    }

    async dejarDeSeguir(id: number): Promise<void>  {
        await this.seguidos.delete({IdSeguido: id});
    } 

}

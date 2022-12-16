library abiMain;

dep publicationStruct;

use publicationStruct::publicationContent;

abi abiMainFunctions
{
//Inicializa el contrato.
  #[storage(read, write)]
  fn constructor();

  //****DEBE RECIBIR EL STRING PARA SETEARLO EN EL CONTENIDO DEL NFT.
  #[storage(read, write)]
  fn setNewPublicationWithOutProposal();

  //****DEBE RECIBIR EL STRING PARA SETEARLO EN EL CONTENIDO DEL NFT.
  #[storage(read, write)]
  fn setNewPublicationWithProposal();
  
  //****DEBE RECIBIR EL STRING PARA SETEARLO EN EL CONTENIDO DEL NFT.
  #[storage(read, write)]
  fn commentWithOutProposal(globalId: u64);

  //****DEBE RECIBIR EL STRING PARA SETEARLO EN EL CONTENIDO DEL NFT.
  #[storage(read, write)]
  fn commentWithProposal(globalId: u64);

  //Devuelve la cantidad total de publicaciones.
  #[storage(read)]
  fn getPublicationsQuantity() -> u64;

  /*
  //Devuelve una publicacion en especifico en base a un globalId.
  #[storage(read)]
  fn getPublicationById() -> publicationContent;
  */
  
  //"FALTAN LAS FUNCIONES PARA EL SINGLENFT Y LAS PROPUESTAS"///
}

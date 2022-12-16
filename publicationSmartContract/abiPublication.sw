library abiPublication;

dep nftStruct;
dep publicationStruct;

use nftStruct::nftContent;
use publicationStruct::publicationContent;

abi abiPublicationFunctions
{
//Inicializa el contrato.
  #[storage(read, write)]
  fn constructor();

  //Retorna la cantidad de comentarios de una publicacion.
  //Recibe de parametro el globalId de la publicacion especifica para acceder a sus comentarios.
  #[storage(read)]
  fn getCommentsCounter(globalId: u64) -> u64;

  //Devuelve el struct del contenido de la publicacion.
  #[storage(read)]
  fn getPublicationById(globalId: u64) -> publicationContent;

  //Crea una nueva publicacion.
  //Recibe el tipo de interaccion desde el mainSC para setearlo. El globalId lo setea en base a la cantidad de publicacion ya creadas (pubCoun+1) y el localId como cero.
  #[storage(read, write)]
  fn setNewPublication(interactionType: u64);

  //Devuelve el contenido del postNft de una publicacion en base a su globalId.
  #[storage(read)]
  fn getPostNftById(globalId: u64) -> nftContent;

  //Devuelve el struct del contenido de un commentNft en especifico en base a su idLocal de un publicacion en especifico en base a la globalId.
  #[storage(read)]
  fn getCommentNftById(globalId: u64, localId: u64) -> nftContent;
}

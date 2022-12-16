library abiNft;

dep nftStruct;

use nftStruct::nftContent;

abi abiNftFunctions
{
  //Inicializa el contrato.
  #[storage(read, write)]
  fn constructor();

  //Crea un nuevo NFT.
  #[storage(read, write)]
  fn setNewNft(interactionType: u64, globalId: u64, localId: u64);

  //Devuelve el struct del contenido del NFT.
  #[storage(read)]
  fn getNftById(localId: u64) -> nftContent;
}

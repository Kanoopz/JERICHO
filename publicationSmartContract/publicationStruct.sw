library publicationStruct;

dep nftStruct;

use nftStruct::nftContent;
use std::storage::StorageVec;

pub struct publicationContent
{
    nftPost: nftContent, 
    //El vector se va a guardar a partir del ID 1.
    vectorComments: Vec<nftContent>,
    commentsCounter: u64,
}

contract;

//"¿SE IMPORTA Y USA PARA LAS USAR FUNCIONES DE UN CONTRATO HEREDADO?"///
/*
versionOne
use std::storage::StorageVec;
dep nftStruct;
dep abiNft;

use nftStruct::nftContent;
use abiNft::abiNftFunctions;
*/

/*
versionTwo
dep publicacionStruct;
dep abiPublication;

use std::storage::StorageVec;
use abiPublication::abiPublicationFunctions;
*/


dep nftStruct;
dep abiNft;
dep publicationStruct;
dep abiPublication;

use nftStruct::nftContent;
use abiNft::abiNftFunctions;
use publicationStruct::publicationContent;
use abiPublication::abiPublicationFunctions;
use std::storage::StorageVec;

storage
{
    linkIdToPublicationStruct: StorageMap<u64, publicationContent> = StorageMap {}, //Empieza en 1.
    vectorStructPublications: StorageVec<publicationContent>  = StorageVec {}, //Empieza en 1.
}

/*
impl abiPublicationFunctions for Contract 
{
    //Inicializa el contrato.
    #[storage(read, write)]
    fn constructor()
    {}

    //Retorna la cantidad de comentarios de una publicacion.
    //Recibe de parametro el globalId de la publicacion especifica para acceder a sus comentarios.
    #[storage(read)]
    fn getCommentsCounter(globalId: u64) -> u64
    {
        let returningCommentsStruct = storage.linkIdToPublicationStruct.get(globalId);
        return returningCommentsStruct.commentsCounter;
    }

    //Devuelve el struct del contenido de la publicacion.
    #[storage(read)]
    fn getPublicationById(globalId: u64) -> publicationContent
    {
        let returningPublicationStruct = storage.linkIdToPublicationStruct.get(globalId);
        return returningPublicationStruct;
    }

    //Crea una nueva publicacion.
    //Recibe el tipo de interaccion desde el mainSC para setearlo. El globalId lo setea en base a la cantidad de publicacion ya creadas (pubCoun+1) y el localId como cero.
    #[storage(read, write)]
    fn setNewPublication(interactionTypeParam: u64)
    {
        let mut length = storage.vectorStructPublications.len();
        length += 1;

        let newNft = nftContent
        {
            interactionType: interactionTypeParam, 
            globalId: length,
            localId: 0,
        };

        let newVectorComments: Vec<nftContent> = StorageVec {};

        let newPublication = publicationContent
        {
            nftPost: newNft, 
            //El vector se va a guardar a partir del ID 1.
            //vectorComments: Vec<nftContent> = StorageVec {},
            vectorComments: newVectorComments,
            commentsCounter: 0,
        };

        storage.vectorStructPublications.insert(length, newPublication);
        storage.linkIdToPublicationStruct.insert(length, newPublication);

        //"HAY QUE USAR LA FUNCION DE NFT PARA QUE SE GUARDE EN EL VECTOR DEL NFT SMARTCONTRACT, NO SOLO EN EL PUBLICATION."///
        /*
        storage.linkIdToNftStruct.insert(length, newNft);
        */
    }

    //Devuelve el contenido del postNft de una publicacion en base a su globalId.
    #[storage(read)]
    fn getPostNftById(globalId: u64) -> nftContent
    {
        let returningPublicationStruct = storage.linkIdToPublicationStruct.get(globalId);
        let returningPostNft = returningPublicationStruct.nftPost;
        return returningPostNft;
    }

    //Devuelve el struct del contenido de un commentNft en especifico en base a su idLocal de un publicacion en especifico en base a la globalId.
    #[storage(read)]
    fn getCommentNftById(globalId: u64, localId: u64) -> nftContent
    {
        let returningPublicationStruct = storage.linkIdToPublicationStruct.get(globalId);
        let returningComments = returningPublicationStruct.vectorComments;
        let returningCommentNft = returningComments.get(localId);
    }
}
*/

impl abiPublicationFunctions for Contract 
{
    //Inicializa el contrato.
    #[storage(read, write)]
    fn constructor()
    {}

    //Retorna la cantidad de comentarios de una publicacion.
    //Recibe de parametro el globalId de la publicacion especifica para acceder a sus comentarios.
    #[storage(read)]
    fn getCommentsCounter(globalId: u64) -> u64
    {
        let returningCommentsStruct = storage.linkIdToPublicationStruct.get(globalId);
        return returningCommentsStruct.commentsCounter;
    }

    //Devuelve el struct del contenido de la publicacion.
    #[storage(read)]
    fn getPublicationById(globalId: u64) -> publicationContent
    {
        let returningPublicationStruct = storage.linkIdToPublicationStruct.get(globalId);
        return returningPublicationStruct;
    }

    //Crea una nueva publicacion.
    //Recibe el tipo de interaccion desde el mainSC para setearlo. El globalId lo setea en base a la cantidad de publicacion ya creadas (pubCoun+1) y el localId como cero.s
    #[storage(read, write)]
    fn setNewPublication(interactionTypeParam: u64)
    {
        let mut length = storage.vectorStructPublications.len();
        length += 1;

        let newNft = nftContent
        {
            interactionType: interactionTypeParam, 
            globalId: length,
            localId: 0,
        };

        let newCommentsVector = Vec::new();

        //"PARA ESTAR SEGURO DE QUE SI ES DE TIPO NFTSTRUCT"///
        /*
            /// Constructs a new, empty `Vec<T>` with the specified capacity.
            ///
            /// The vector will be able to hold exactly `capacity` elements without
            /// reallocating. If `capacity` is 0, the vector will not allocate.
            ///
            /// It is important to note that although the returned vector has the
            /// *capacity* specified, the vector will have a zero *length*.
            ///
            /// ### Examples
            ///
            /// ```sway
            /// use std::vec::Vec;
            ///
            /// let vec = Vec::with_capacity(2);
            /// // does not allocate
            /// vec.push(5);
            /// // does not re-allocate
            /// vec.push(10);
            /// ```
            pub fn with_capacity(capacity: u64) -> Self {
                Self {
                    buf: RawVec::with_capacity(capacity),
                    len: 0,
                }
            }
        */

        let newPublication = publicationContent
        {
            nftPost: newNft, 
            //El vector se va a guardar a partir del ID 1.
            //vectorComments: Vec<nftContent> = StorageVec {},
            vectorComments: newCommentsVector,
            commentsCounter: 0,
        };

        storage.vectorStructPublications.insert(length, newPublication);
        storage.linkIdToPublicationStruct.insert(length, newPublication);

        //"HAY QUE USAR LA FUNCION DE NFT PARA QUE SE GUARDE EN EL VECTOR DEL NFT SMARTCONTRACT, NO SOLO EN EL PUBLICATION."///
        /*
        storage.linkIdToNftStruct.insert(length, newNft);
        */
    }

    //Devuelve el contenido del postNft de una publicacion en base a su globalId.
    #[storage(read)]
    fn getPostNftById(globalId: u64) -> nftContent
    {
        let returningPublicationStruct = storage.linkIdToPublicationStruct.get(globalId);
        let returningPostNft = returningPublicationStruct.nftPost;
        return returningPostNft;
    }

    //Devuelve el struct del contenido de un commentNft en especifico en base a su idLocal de un publicacion en especifico en base a la globalId.
    #[storage(read)]
    fn getCommentNftById(globalId: u64, localId: u64) -> nftContent
    {
        let returningPublicationStruct = storage.linkIdToPublicationStruct.get(globalId);
        let returningComments = returningPublicationStruct.vectorComments;
        let returningCommentNft = returningComments.get(localId).unwrap();
        return returningCommentNft;
    }
}

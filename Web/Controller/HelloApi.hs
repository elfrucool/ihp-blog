module Web.Controller.HelloApi where

import Web.Controller.Prelude

import qualified Data.Text as T



instance Controller HelloApiController where
    action HelloApiAction = do
        body <- getRequestBody
        let helloRequest = fromMaybe defaultHelloRequest $ decode body
        let name = get #name helloRequest
        let hello = HelloActionResponse { name = name <> "!", message = "Hello" }
        renderJson (toJSON hello)


data HelloActionResponse = HelloActionResponse
    { name :: Text
    , message :: Text
    } deriving (Data, Eq, Show)

newtype HelloActionRequest = HelloActionRequest
    { name :: Text
    } deriving (Data, Eq, Show)

instance ToJSON HelloActionResponse where
    toJSON hello = object
        [ "name" .= get #name hello
        , "message" .= get #message hello
        ]

instance FromJSON HelloActionRequest where
    parseJSON = withObject "HelloActionRequest" $ \obj ->
        HelloActionRequest
            <$> obj .: "name"


defaultHelloRequest :: HelloActionRequest
defaultHelloRequest = HelloActionRequest "World"
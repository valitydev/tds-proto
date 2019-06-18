namespace java com.rbkmoney.tds.storage

typedef string Token

struct TokenData {
    1: required Token access_token
}

struct PutTokenResult {
    1: required Token token
}

exception InvalidTokenData {
    1: optional string reason
}

exception TokenDataNotFound { }

service Storage {

    /** Получить токен */
    TokenData GetTokenData (1: Token token)
        throws (1: TokenDataNotFound not_found)

    /** Сохранить токен */
    PutTokenResult PutToken (1: TokenData token_data)
        throws (1: InvalidTokenData invalid)
}

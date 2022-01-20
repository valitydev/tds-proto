namespace java dev.vality.tds.storage
namespace erlang tds

typedef string TokenContent
typedef string TokenID

struct Token {
    1: required TokenContent content
}

exception TokenNotFound {}

/**
 * Интерфейс для приложений
 *
 * При недоступности (отсутствии или залоченности) кейринга сервис сигнализирует об этом с помощью
 * woody-ошибки `Resource Unavailable`.
 */
service TokenStorage {

    /** Получить токен */
    Token GetToken (1: TokenID token_id)
        throws (
            1: TokenNotFound not_found
        )

    /** Сохранить токен */
    void PutToken (1: TokenID token_id, 2: Token token)
        throws (
        )
}

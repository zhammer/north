CREATE FUNCTION me(hasura_session json)
RETURNS SETOF users AS $$
    SELECT * FROM users WHERE id = (hasura_session ->> 'x-hasura-user-id')::int
$$ LANGUAGE sql STABLE;

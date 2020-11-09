alter table "public"."users"
add constraint "username_check" check (
    char_length(username) >= 4
    AND char_length(username) < 32
    AND username ~ '^[a-zA-Z0-9\._]+$' :: text
);

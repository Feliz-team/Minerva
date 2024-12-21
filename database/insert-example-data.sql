-- liquibase formatted sql

-- changeset Alex_Zemtsov:1734695576225-1
INSERT INTO public."Account_types"(id, type_name)
	VALUES (1, 'student');

INSERT INTO public."Account_types"(id, type_name)
	VALUES (2, 'hire manager');

INSERT INTO public."Account_types"(id, type_name)
	VALUES (3, 'admin');

-- changeset Alex_Zemtsov:1734695576225-2
INSERT INTO public."Accounts"(user_name, type_id, email, hashed_password, profile_proto, phone, resume)
	VALUES ('Antonio', 1, 'Antonio_email', 'hashed_1234', null, 380554444, null);

INSERT INTO public."Accounts"(user_name, type_id, email, hashed_password, profile_proto, phone, resume)
	VALUES ('Marta', 1, 'Marta_email', 'hashed_1234', null, 380554444, null);

INSERT INTO public."Accounts"(user_name, type_id, email, hashed_password, profile_proto, phone, resume)
	VALUES ('Admin', 3, 'Admin_email', 'hashed_1234', null, null, null);

INSERT INTO public."Accounts"(user_name, type_id, email, hashed_password, profile_proto, phone, resume)
	VALUES ('Scott', 2, 'Scott_email', 'tiger', null, 5764536, null);
CREATE TABLE "Accounts"(
    "id" BIGINT NOT NULL,
    "user_name" VARCHAR(255) NOT NULL,
    "type_id" BIGINT NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "hashed_password" VARCHAR(255) NOT NULL,
    "profile_proto" JSON NULL,
    "phone" VARCHAR(255) CHECK
        ("phone" IN('')) NULL,
        "resume" JSON NULL
);
ALTER TABLE
    "Accounts" ADD PRIMARY KEY("id");
CREATE TABLE "Account_types"(
    "id" BIGINT NOT NULL,
    "type_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Account_types" ADD PRIMARY KEY("id");
CREATE TABLE "Person"(
    "account_id" BIGINT NOT NULL,
    "name" VARCHAR(255) NULL,
    "surname" VARCHAR(255) NULL,
    "father_name" VARCHAR(255) NULL,
    "dob" DATE NULL
);
ALTER TABLE
    "Person" ADD PRIMARY KEY("account_id");
CREATE TABLE "Achievements"(
    "account_id" BIGINT NOT NULL,
    "total_tests_count" BIGINT NOT NULL DEFAULT '0',
    "total_exercises_count" BIGINT NOT NULL DEFAULT '0',
    "total_articles_count" BIGINT NOT NULL DEFAULT '0'
);
ALTER TABLE
    "Achievements" ADD PRIMARY KEY("account_id");
CREATE TABLE "Articles"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "rating" BIGINT NULL DEFAULT '0',
    "author_id" BIGINT NOT NULL,
    "first_paragraph" VARCHAR(255) NOT NULL,
    "file" JSON NOT NULL,
    "theme_id" BIGINT NOT NULL
);
ALTER TABLE
    "Articles" ADD PRIMARY KEY("id");
COMMENT
ON COLUMN
    "Articles"."first_paragraph" IS 'will be shown as a preview, can be the first paragraph of the file or manually inserted';
CREATE TABLE "Tests"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "rating" BIGINT NULL DEFAULT '0',
    "author_id" BIGINT NOT NULL,
    "file" JSON NOT NULL
);
ALTER TABLE
    "Tests" ADD PRIMARY KEY("id");
CREATE TABLE "Vacancy"(
    "id" BIGINT NOT NULL,
    "title" BIGINT NOT NULL,
    "file" JSON NOT NULL,
    "hire_manager_id" BIGINT NOT NULL,
    "publish_date" DATE NOT NULL,
    "remove_date" DATE NOT NULL,
    "views" BIGINT NULL DEFAULT '0'
);
ALTER TABLE
    "Vacancy" ADD PRIMARY KEY("id");
CREATE TABLE "Article_Themes"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Article_Themes" ADD PRIMARY KEY("id");
ALTER TABLE
    "Vacancy" ADD CONSTRAINT "vacancy_hire_manager_id_foreign" FOREIGN KEY("hire_manager_id") REFERENCES "Accounts"("id");
ALTER TABLE
    "Achievements" ADD CONSTRAINT "achievements_account_id_foreign" FOREIGN KEY("account_id") REFERENCES "Accounts"("id");
ALTER TABLE
    "Accounts" ADD CONSTRAINT "accounts_type_id_foreign" FOREIGN KEY("type_id") REFERENCES "Account_types"("id");
ALTER TABLE
    "Articles" ADD CONSTRAINT "articles_author_id_foreign" FOREIGN KEY("author_id") REFERENCES "Accounts"("id");
ALTER TABLE
    "Tests" ADD CONSTRAINT "tests_author_id_foreign" FOREIGN KEY("author_id") REFERENCES "Accounts"("id");
ALTER TABLE
    "Person" ADD CONSTRAINT "person_account_id_foreign" FOREIGN KEY("account_id") REFERENCES "Accounts"("id");
ALTER TABLE
    "Articles" ADD CONSTRAINT "articles_theme_id_foreign" FOREIGN KEY("theme_id") REFERENCES "Article_Themes"("id");
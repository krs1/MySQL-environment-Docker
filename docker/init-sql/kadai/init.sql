-- 練習問題用データベース作成
CREATE DATABASE IF NOT EXISTS kadai;
USE kadai;

-- テーブル: staffs
CREATE TABLE IF NOT EXISTS staffs (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contract ENUM('PROPER', 'FREE_LANCE') NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) DEFAULT NULL,
    mail VARCHAR(255) NOT NULL,
    phone_number VARCHAR(16) NOT NULL COMMENT '(国際コード)2桁+(ハイフン)3桁+(市外局番+市内局番+契約番号の最大桁数)11桁',
    address VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    hire_date DATE NOT NULL,
    retirement_date DATE DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL
);

-- テーブル: positions
CREATE TABLE IF NOT EXISTS positions (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL
);


-- テーブル: users
CREATE TABLE IF NOT EXISTS users (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(255) NOT NULL,
    phone_number VARCHAR(16) NOT NULL COMMENT '(国際コード)2桁+(ハイフン)3桁+(市外局番+市内局番+契約番号の最大桁数)11桁',
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    position_id INT(11) NOT NULL,
    status ENUM('ENGAGED', 'LEAVE', 'RETIREMENT') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL,
    CONSTRAINT fk_users_position FOREIGN KEY (position_id) REFERENCES positions(id)
);

-- テーブル: loan_plans
CREATE TABLE IF NOT EXISTS loan_plans (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    staff_id INT(11) NOT NULL,
    user_in_charge_id INT(11) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    expected_end_date DATE NOT NULL,
    target_charge INT(11) DEFAULT NULL,
    memo TEXT DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL,
    CONSTRAINT fk_loan_plans_staff FOREIGN KEY (staff_id) REFERENCES staffs(id),
    CONSTRAINT fk_loan_plans_user FOREIGN KEY (user_in_charge_id) REFERENCES users(id)
);

-- テーブル: suggestions
CREATE TABLE IF NOT EXISTS suggestions (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    loan_plan_id INT(11) NOT NULL,
    user_in_charge_id INT(11) NOT NULL,
    client_name VARCHAR(255) NOT NULL,
    end_date DATE DEFAULT NULL COMMENT 'これが入っていれば、提案が終了している',
    completion_reason ENUM('CLIENT_NG', 'DECLINE', 'OTHER_LOAN', 'LOAN') DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL,
    CONSTRAINT fk_suggestions_loan_plan FOREIGN KEY (loan_plan_id) REFERENCES loan_plans(id),
    CONSTRAINT fk_suggestions_user FOREIGN KEY (user_in_charge_id) REFERENCES users(id)
);

-- テーブル: daily_goals
CREATE TABLE IF NOT EXISTS daily_goals (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    type ENUM('SUGGESTION') NOT NULL,
    date DATE NOT NULL,
    count INT(11) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL,
    CONSTRAINT fk_daily_goals_user FOREIGN KEY (user_id) REFERENCES users(id)
);

-- テーブル: month_goals
CREATE TABLE IF NOT EXISTS month_goals (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    type ENUM('SALES_PROPER', 'SALES_FREE_LANCE', 'SUGGESTION', 'LOAN') NOT NULL,
    `year_month` VARCHAR(6) NOT NULL COMMENT '「202112」のような形式',
    count INT(11) NOT NULL COMMENT '目標値',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL,
    CONSTRAINT fk_month_goals_user FOREIGN KEY (user_id) REFERENCES users(id)
);

-- テーブル: loans
CREATE TABLE IF NOT EXISTS loans (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    loan_plan_id INT(11) NOT NULL,
    suggestion_id INT(11) NOT NULL,
    staff_id INT(11) NOT NULL,
    user_in_charge_id INT(11) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL COMMENT 'これが入ったら退場が確定',
    project_name VARCHAR(255) NOT NULL,
    charge INT(11) NOT NULL,
    settlement_lower INT(11) NOT NULL,
    settlement_upper INT(11) NOT NULL,
    payment_site INT(11) NOT NULL COMMENT '何十日後か',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    created_by INT(11) NOT NULL,
    updated_by INT(11) NULL,
    CONSTRAINT fk_loans_loan_plan FOREIGN KEY (loan_plan_id) REFERENCES loan_plans(id),
    CONSTRAINT fk_loans_suggestion FOREIGN KEY (suggestion_id) REFERENCES suggestions(id),
    CONSTRAINT fk_loans_staff FOREIGN KEY (staff_id) REFERENCES staffs(id),
    CONSTRAINT fk_loans_user FOREIGN KEY (user_in_charge_id) REFERENCES users(id)
);


-- 初期化（テーブルのデータを削除）
SET FOREIGN_KEY_CHECKS = 0; -- 外部キー制約を一時無効化

TRUNCATE TABLE staffs;
TRUNCATE TABLE positions;
TRUNCATE TABLE users;
TRUNCATE TABLE loan_plans;
TRUNCATE TABLE suggestions;
TRUNCATE TABLE daily_goals;
TRUNCATE TABLE month_goals;
TRUNCATE TABLE loans;

SET FOREIGN_KEY_CHECKS = 1; -- 外部キー制約を再有効化

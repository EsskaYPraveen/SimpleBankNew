-- Define a table for storing account information
CREATE TABLE IF NOT EXISTS accounts (
    id BIGSERIAL PRIMARY KEY,      -- Unique identifier for each account
    owner TEXT NOT NULL,           -- The owner of the account
    balance BIGINT NOT NULL,       -- The current balance of the account
    currency TEXT NOT NULL,        -- The currency type (e.g., USD, EUR)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()  -- Timestamp for when the account was created
);

-- Define a table for storing transactions
CREATE TABLE IF NOT EXISTS transactions (
    id BIGSERIAL PRIMARY KEY,      -- Unique identifier for each transaction
    account_id BIGINT NOT NULL REFERENCES accounts(id) ON DELETE CASCADE,  -- Foreign key reference to the accounts table
    amount BIGINT NOT NULL,        -- The amount of money being transacted
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()  -- Timestamp for when the transaction occurred
);

-- Create an index on the transactions table for fast lookup by account_id
CREATE INDEX idx_account_id ON transactions(account_id);

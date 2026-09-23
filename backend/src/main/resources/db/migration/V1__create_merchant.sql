CREATE TABLE merchants (
                           id UUID PRIMARY KEY,

                           tenant_id UUID NOT NULL,

                           external_merchant_id VARCHAR(100) NOT NULL,

                           legal_name VARCHAR(255) NOT NULL,

                           display_name VARCHAR(255),

                           country_code CHAR(2) NOT NULL,

                           default_currency CHAR(3) NOT NULL,

                           status VARCHAR(30) NOT NULL,

                           created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

                           updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

                           CONSTRAINT uk_merchants_tenant_external
                               UNIQUE (tenant_id, external_merchant_id)
);

CREATE INDEX idx_merchants_tenant_id
    ON merchants (tenant_id);

CREATE INDEX idx_merchants_status
    ON merchants (status);
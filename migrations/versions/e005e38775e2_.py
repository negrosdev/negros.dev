"""empty message

Revision ID: e005e38775e2
Revises: adda91e02e52
Create Date: 2022-01-22 17:22:55.400626

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e005e38775e2'
down_revision = 'adda91e02e52'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('comments')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('comments',
    sa.Column('id', sa.INTEGER(), nullable=False),
    sa.Column('text', sa.TEXT(), nullable=False),
    sa.Column('status', sa.BOOLEAN(), nullable=True),
    sa.Column('author_id', sa.INTEGER(), nullable=False),
    sa.Column('content_id', sa.INTEGER(), nullable=False),
    sa.Column('created_on', sa.DATETIME(), server_default=sa.text('(CURRENT_TIMESTAMP)'), nullable=True),
    sa.ForeignKeyConstraint(['author_id'], ['users.id'], ),
    sa.ForeignKeyConstraint(['content_id'], ['contents.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###

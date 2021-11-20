"""empty message

Revision ID: 4086f13c168f
Revises: 
Create Date: 2021-11-20 10:09:35.821969

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4086f13c168f'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('users',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.String(length=85), nullable=False),
    sa.Column('email', sa.String(length=85), nullable=False),
    sa.Column('pwd_hash', sa.String(length=255), nullable=False),
    sa.Column('description', sa.String(length=79), nullable=False),
    sa.Column('role', sa.Enum('USER', 'AUTHOR', 'STAFF', 'ADMIN', name='erole'), nullable=True),
    sa.Column('created_on', sa.DateTime(), server_default=sa.text('(CURRENT_TIMESTAMP)'), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('email')
    )
    op.create_table('contents',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.String(length=100), nullable=False),
    sa.Column('slug', sa.String(length=120), nullable=False),
    sa.Column('description', sa.Text(), nullable=False),
    sa.Column('text', sa.Text(), nullable=True),
    sa.Column('embeded', sa.Text(), nullable=True),
    sa.Column('status', sa.Enum('PUBLISHED', 'UNPUBLISHED', 'DRAFT', name='estatus'), nullable=True),
    sa.Column('author_id', sa.Integer(), nullable=False),
    sa.Column('created_on', sa.DateTime(), server_default=sa.text('(CURRENT_TIMESTAMP)'), nullable=True),
    sa.ForeignKeyConstraint(['author_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('slug')
    )
    op.create_table('comments',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('text', sa.Text(), nullable=False),
    sa.Column('status', sa.Boolean(), nullable=True),
    sa.Column('author_id', sa.Integer(), nullable=False),
    sa.Column('content_id', sa.Integer(), nullable=False),
    sa.Column('created_on', sa.DateTime(), server_default=sa.text('(CURRENT_TIMESTAMP)'), nullable=True),
    sa.ForeignKeyConstraint(['author_id'], ['users.id'], ),
    sa.ForeignKeyConstraint(['content_id'], ['contents.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('related',
    sa.Column('content_id', sa.Integer(), nullable=True),
    sa.Column('requirement_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['content_id'], ['contents.id'], ),
    sa.ForeignKeyConstraint(['requirement_id'], ['contents.id'], )
    )
    op.create_table('sources',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.String(length=100), nullable=False),
    sa.Column('link', sa.String(), nullable=False),
    sa.Column('content_id', sa.Integer(), nullable=False),
    sa.Column('created_on', sa.DateTime(), server_default=sa.text('(CURRENT_TIMESTAMP)'), nullable=True),
    sa.ForeignKeyConstraint(['content_id'], ['contents.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('sources')
    op.drop_table('related')
    op.drop_table('comments')
    op.drop_table('contents')
    op.drop_table('users')
    # ### end Alembic commands ###
